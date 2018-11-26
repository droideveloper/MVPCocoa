//
//  MainPresenterImp.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 26.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation

class MainPresenterImp: BasePresenter, MainPresenter {
	
	private let view: MainView
	
	init(view: MainView) {
		self.view = view
	}
	
	override func didLoad() {
		// do code here
	}
	
	override func attach() {
		disposeBag += view.observeTextChange()
			.subscribe()
	}
	
	override func detach() {
		disposeBag.clear()
	}
}
