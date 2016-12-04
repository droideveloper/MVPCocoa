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

public class Material: NSObject {
	
	private static var inBundle: Bundle?;
	
	public static var bundle: Bundle {
		if nil == Material.inBundle {
			Material.inBundle = Bundle(for: CompoundButton.self);
			let url = Material.inBundle!.resourceURL!;
			let b = Bundle(url: url.appendingPathComponent("org.fs.core.icons.bundle"));
			if let v = b {
				Material.inBundle = v;
			}
		}
		return Material.inBundle!;
	}
	
	public static func icon(_ name: String) -> UIImage? {
		return UIImage(named: name, in: bundle, compatibleWith: nil)?.withRenderingMode(.alwaysTemplate);
	}
	
	public static func icon(_ forIconSet: IconSet) -> UIImage? {
		return icon("\(forIconSet)");
	}
}
