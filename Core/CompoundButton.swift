/*
 * Core Copyright (C) 2016 Fatih.
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

open class CompoundButton: Button {
	
	private var isRightToLeft : Bool {
		if #available(iOS 10.0, *) {
			return effectiveUserInterfaceLayoutDirection == .rightToLeft
		} else {
			return false;
		}
	}
	
	public var accentColor: UIColor? = Color.pink.base {
		didSet {
			let selectedImage = image(for: .selected);
			if let color = accentColor {
				if let image = selectedImage {
					setImage(image.tint(with: color), for: .selected);
				}
			}
			let notSelectedImage = image(for: .normal);
			if let image = notSelectedImage {
				setImage(image.tint(with: Color.black), for: .normal);
			}
		}
	}
	
	public var textColor: UIColor? = Color.darkText.primary {
		didSet {
			if let color = textColor {
				titleLabel?.textColor = color;
			}
		}
	}
	
	public var isChecked: Bool {
		return isSelected;
	}
	
	open override func prepare() {
		super.prepare();
		prepareViews();
	}
	
	private func prepareViews() {
		if isRightToLeft {
			imageView?.contentMode  = .right;
			titleLabel?.contentMode = .left;
		} else {
			imageView?.contentMode  = .left;
			titleLabel?.contentMode = .right;
		}
		addTarget(self, action: #selector(onStateChange), for: .touchUpInside);
	}
	
	@objc private func onStateChange() {
		isSelected = !isSelected;
	}
}
