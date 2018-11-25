//
//  BusManager.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 25.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation
import RxSwift

public class BusManager {
	
	private static let bus = PublishSubject<Event>()
	
	public static func send<T>(event: T) where T: Event {
		bus.onNext(event)
	}
	
	public static func register(_ block: @escaping (Event) -> Void) -> Disposable {
		return bus.subscribe(onNext: block)
	}
}
