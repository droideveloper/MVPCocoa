/*
 * MVPCocoa Copyright (C) 2016 Fatih.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit

import Material

public class Flat: FlatButton, LogType {
	
	public var callback: (() -> Void)?;
	public var buttonStyle: ButtonStyle = .borderless {
		didSet {
			switch buttonStyle {
				case .borderless:
					backgroundColor = .clear;
					titleColor = tintColor;
					break;
				case .colored:
					backgroundColor = tintColor;
					titleColor = .white;
					break;
			}
		}
	}
	
	public convenience init(callback: (() -> Void)? = nil) {
		self.init(frame: .zero);
		self.callback = callback;
	}
	
	public convenience init(title: String?, tintColor: UIColor?, callback: (() -> Void)? = nil) {
		self.init(callback: callback);
		self.title = title;
		if let tintColor = tintColor {
			self.tintColor = tintColor;
		}
	}
	
	override public func prepare() {
		super.prepare();
		addTarget(self, action: #selector(tapSelector), for: .touchUpInside);
	}
	
	@objc func tapSelector() {
		if let delegate = callback {
			delegate();
		}
	}
	
	public func isLogEnabled() -> Bool {
		return true;
	}
	
	public func getClassTag() -> String {
		return String(describing: Flat.self);
	}
}
