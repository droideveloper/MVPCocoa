//
//  BaseCollectionController.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 30.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation
import UIKit

open class BaseCollectionController<P>: UICollectionViewController where P: Presenter {
	
	open var presenter: P! // only need this for that reason
	
	open var isAvailable: Bool {
		get {
			return true
		}
	}
	
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
		super.viewWillDisappear(animated)
	}
	
	open func showError(_ message: String) {
		showError(message, .alert)
	}
	
	open func showError(_ message: String, completion: @escaping () -> Void) {
		showError(message, .alert, completion)
	}
	
	open func showProgress() {
		fatalError("showProgress is not implemented before you should implement this method")
	}
	
	open func hideProgress() {
		fatalError("hideProgress is not implemented before you should implement this method")
	}
}
