//
//  BasePresenterProxy.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 1.05.2019.
//  Copyright © 2019 Open Source. All rights reserved.
//

import Foundation

open class BasePresenterProxy: Presenter {
	
	private let delegate: Presenter
	
	public init(presenter: Presenter) {
		self.delegate = presenter
	}
	
	public func didLoad() {
		delegate.didLoad()
	}
	
	public func attach() {
		delegate.attach()
	}
	
	public func detach() {
		delegate.detach()
	}
}
