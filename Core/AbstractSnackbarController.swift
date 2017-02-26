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

open class AbstractSnackbarController<P>: SnackbarController where P: PresenterDelegate {
	
	open var presenter: P?;
	
	open override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated);
		presenter?.viewWillAppear(animated);
	}
	
	open override func viewDidLoad() {
		super.viewDidLoad();
		presenter?.viewDidLoad();
	}
	
	open override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated);
		presenter?.viewWillDisappear(animated);
	}
	
	open override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning();
		presenter?.didReceiveMemoryWarning();
	}
}
