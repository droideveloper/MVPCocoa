//
//  BaseViewProxy.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 1.05.2019.
//  Copyright © 2019 Open Source. All rights reserved.
//

import Foundation

open class BaseViewProxy: View {

	private let delegate: View?
	
	public init(view: View) {
		self.delegate = view
	}
	
	public var isAvailable: Bool {
		get {
			return delegate?.isAvailable ?? false
		}
	}
	
	public func showError(_ message: String) {
		delegate?.showError(message)
	}
	
	public func showError(_ message: String, completion: @escaping () -> Void) {
		delegate?.showError(message, completion: completion)
	}
	
	public func showProgress() {
		delegate?.showProgress()
	}
	
	public func hideProgress() {
		delegate?.hideProgress()
	}
}
