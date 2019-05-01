//
//  BasePresenterProxy.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 1.05.2019.
//  Copyright © 2019 Open Source. All rights reserved.
//

import Foundation

open class BasePresenterProxy: Presenter {
	
	private let presenter: Presenter
	
	public init(presenter: Presenter) {
		self.presenter = presenter
	}
	
	public func didLoad() {
		presenter.didLoad()
	}
	
	public func attach() {
		presenter.attach()
	}
	
	public func detach() {
		presenter.detach()
	}
}
