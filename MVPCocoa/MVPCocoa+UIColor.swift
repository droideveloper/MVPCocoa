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


extension UIColor {
	
	public class func rgb(_ rgb: Int32, alpha: CGFloat = 1) -> UIColor {
		return UIColor(red: CGFloat((rgb >> 16) & 0xFF) / 255,
		               green: CGFloat((rgb >> 8) & 0xFF) / 255,
		               blue: CGFloat(rgb & 0xFF) / 255,
		               alpha: alpha);
	}
	
	public class func argb(_ argb: Int64) -> UIColor {
		return rgb(Int32(argb), alpha: CGFloat((argb >> 24) & 0xFF) / 255);
	}
	
}
