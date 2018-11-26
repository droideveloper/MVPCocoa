//
//  BasePresenter.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 25.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation

open class BasePresenter {
	
	public lazy var disposeBag = {
		CompositeDisposeBag()
	}()
	
	open func didLoad() { }
	open func attach() { }
	open func detach() { }
}
