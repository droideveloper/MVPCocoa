//
//  BaseViewProxy.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 1.05.2019.
//  Copyright © 2019 Open Source. All rights reserved.
//

import Foundation

open class BaseViewProxy: View {

	private let view: View
	
	public init(view: View) {
		self.view = view
	}
	
	public var isAvailable: Bool {
		get {
			return view.isAvailable
		}
	}
	
	public func setUp() {
		view.setUp()
	}
	
	public func showError(_ message: String) {
		view.showError(message)
	}
	
	public func showError(_ message: String, completion: @escaping () -> Void) {
		view.showError(message, completion: completion)
	}
	
	public func showProgress() {
		view.showProgress()
	}
	
	public func hideProgress() {
		view.hideProgress()
	}
}
