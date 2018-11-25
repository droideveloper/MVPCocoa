//
//  Observable+Extension.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 25.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation
import RxSwift

extension Observable {
	
	public func async<V>(_ view: V? = nil) -> Observable<Element> where V: View {
		return subscribeOn(MainScheduler.asyncInstance)
			.do(onError: { _ in
				view?.hideProgress() // on error we do hide progress
			}, onCompleted: {
				view?.hideProgress() // on complete we do hide progress
			}, onSubscribe: {
				view?.showProgress() // on subscription view show progress
			}, onDispose: {
				view?.hideProgress() // if disposed we hide progress
			})
			.observeOn(MainScheduler.instance)
	}
}
