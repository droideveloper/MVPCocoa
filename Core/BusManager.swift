/*
 * Core Copyright (C) 2016 Fatih.
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
	
	private static let RxBus = PublishSubject<EventDelegate>();

	public static func register<E>(on: @escaping (E) -> Void) -> Disposable where E: EventDelegate {
		return RxBus.subscribe( onNext: { event in
			if event is E {
				on(event as! E);
			}
		});
	}
	
	public static func post<E>(event: E) where E: EventDelegate {
		RxBus.on(.next(event));
	}
}
