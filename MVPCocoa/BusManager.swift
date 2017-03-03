/*
 * MVPCocoa Copyright (C) 2016 Fatih.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Foundation

import RxSwift

public final class BusManager {
	
	private static let RxBus = PublishSubject<EventType>();

	public static func register(next: @escaping (EventType) -> Void) -> Disposable {
		return RxBus.subscribe(onNext: next);
	}
	
	public static func register(next: @escaping (EventType) -> Void, error: @escaping (Error) -> Void) -> Disposable {
		return RxBus.subscribe(onNext: next, onError: error);
	}
	
	public static func unregister(disposeable: Disposable?) -> Void {
		if let disposeable = disposeable {
			disposeable.dispose();
		}
	}
	
	public static func post(event: EventType) -> Void {
		RxBus.on(.next(event));
	}
	
	public static func toObservable() -> Observable<EventType> {
		return RxBus.asObservable();
	}
	
	public static func toObserver() -> AnyObserver<EventType> {
		return RxBus.asObserver();
	}
}
