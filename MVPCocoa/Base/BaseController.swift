//
//  BaseController.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 25.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation
import UIKit

open class BaseController: UIViewController {
	open var presenter: Presenter! // only need this for that reason
	
	open override func viewDidLoad() {
		super.viewDidLoad()
		presenter.didLoad()
	}
	
	open override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		presenter.attach()
	}
	
	open override func viewWillDisappear(_ animated: Bool) {
		presenter.detach()
		super.viewWillAppear(animated)
	}
	
	open func setUp() { }
	
	open func showError(_ message: String) {
		showError(message, .alert)
	}
	
	open func showError(_ message: String, completion: @escaping () -> Void) {
		showError(message, .alert, completion)
	}
	
	open func showProgress() { }

	open func hideProgress() { }
}
