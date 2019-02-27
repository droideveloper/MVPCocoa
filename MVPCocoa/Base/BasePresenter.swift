//
//  BasePresenter.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 25.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation

open class BasePresenter<V> where V: View {
	
	public let view: V
	
	public let disposeBag = CompositeDisposeBag()

	init(view: V) {
		self.view = view
	}
	
	open func didLoad() { }
	open func attach() { }
	open func detach() { }
}
