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
import CoreData

import RxSwift
import SugarRecordCoreData

public enum DataError: Error {
	case entityNotFound
}

extension CoreDataDefaultStorage: ReactiveCompatible { }

extension Reactive where Base: CoreDataDefaultStorage {
	
	// operation T instance
	func operation<T: Entity>(_ operation: @escaping (Context, @escaping () -> Void) throws -> T) -> Observable<T> {
		return Observable.create({ observer -> Disposable in
			do {
				let data: T = try self.base.operation(operation);
				observer.on(.next(data));
				observer.on(.completed);
			} catch let error {
				observer.on(.error(error));
			}
			return Disposables.create();
		});
	}
	
	// operation T array instance
	func operation<T: Entity>(_ operation: @escaping (Context, @escaping () -> Void) throws -> [T]) -> Observable<[T]> {
		return Observable.create({ observer -> Disposable in
			do {
				let data: [T] = try self.base.operation(operation);
				observer.on(.next(data));
				observer.on(.completed);
			} catch let error {
				observer.on(.error(error));
			}
			return Disposables.create();
		});
	}
	
	// create T instance
	public func create<T: Entity>(_ create: @escaping (Context) throws -> T) -> Observable<T> {
		return operation({ (context, save) in
			let o: T = try create(context);
			save();
			return o;
		});
	}
	
	// new T instance
	public func new<T: Entity>(_ new: @escaping (Context) throws -> T) -> Observable<T> {
		return operation({ (context, save) in
			let o: T = try new(context);
			try context.insert(o);
			save();
			return o;
		});
	}
	
	// delete T instance from store
	public func delete<T: Entity>(_ delete: @escaping (Context) throws -> T?) -> Observable<T> {
		return operation({ (context, save) in
			if let o = try delete(context) {
				try context.remove(o);
				save();
				return o;
			}
			throw DataError.entityNotFound;
		});
	}
	
	// update T instance from store
	public func update<T: Entity>(_ update: @escaping (Context) throws -> T?) -> Observable<T> {
		return operation({ (context, save) in
			if let o = try update(context) {
				save();
				return o;
			}
			throw DataError.entityNotFound;
		});
	}
	
	// query with predicate in we find here
	public func query<T: Entity>(_ query: @escaping (T) throws -> Bool) -> Observable<T> {
		return queryAll().flatMap({ (array: [T]) -> Observable<T> in
			do {
				if let first = try array.first(where: query) {
					return Observable.just(first);
				}
				return Observable.empty();
			} catch let error {
				return Observable.error(error);
			}
		});
	}
	
	// grab everything
	public func queryAll<T: Entity>() -> Observable<[T]> {
		return operation({ (context, save) in
			return try context.fetch(FetchRequest<T>());
		});
	}
	
	// sort by property and (asc or desc)
	public func sortBy<T: Entity>(_ key: String, ascending: Bool = false) -> Observable<[T]> {
		return operation({ (context, save) in
			return try context.fetch(FetchRequest<T>().sorted(with: key, ascending: ascending));
		});
	}
	
	// sort by descriptor
	public func sortBy<T: Entity>(_ sort: NSSortDescriptor) -> Observable<[T]> {
		return operation({ (context, save) in
			return try context.fetch(FetchRequest<T>().sorted(with: sort));
		});
	}
	
	public func filterBy<T: Entity>(_ key: String, value: String) -> Observable<[T]> {
		return operation({ (context, save) in
			return try context.fetch(FetchRequest<T>().filtered(with: key, equalTo: value));
		});
	}
	
	public func filterBy<T: Entity>(_ predicate: NSPredicate) -> Observable<[T]> {
		return operation({ (context, save) in
			return try context.fetch(FetchRequest<T>().filtered(with: predicate));
		});
	}
}
