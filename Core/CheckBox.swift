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

public class CheckBox: CompoundButton {
	
	public override func prepare() {
		super.prepare();
		//pulse color
		pulseColor = Color.grey.lighten2;
		//set title font
		titleLabel?.font = RobotoFont.light(with: 12);
		//set check state images
		setImage(Material.icon(.ic_check_box_outline_blank), for: .normal);
		setImage(Material.icon(.ic_check_box), for: .selected);
	}
}
