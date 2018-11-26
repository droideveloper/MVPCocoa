//
//  MainController.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 26.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class MainController: BaseController<MainPresenter>, MainView {
	
	func setPresenter(_ presenter: MainPresenter) {
		self.presenter = presenter
	}
	
	func observeTextChange() -> Observable<String> {
		let field = UITextField()
		return field.rx.text.asObservable()
			.map { $0 ?? String.empty }
	}
}
