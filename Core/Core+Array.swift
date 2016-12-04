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

extension Array {
	public typealias T = Element;
	
	public func get(index: Int) -> T? {
		if index >= 0 && index < size() {
			return self[index];
		}
		return nil;
	}
	
	public func size() -> Int {
		return count;
	}
	
	public mutating func add(item: T) {
		append(item);
	}
	
	public mutating func addAt(item: T, at index: Int) {
		if index >= 0 && index < size() {
			insert(item, at: index);
		}
	}
	
	public mutating func addAll(items: Array<T>) {
		append(contentsOf: items);
	}
	
	public mutating func addAll(items: Array<T>, at index: Int) {
		if index >= 0 && index < size() {
			var position: Int = index;
			for item in items {
				addAt(item: item, at: position);
				position += 1;
			}
		}
	}
	
	public var last: T? {
		get {
			if count > 0 {
				return get(index: count - 1);
			} else {
				return nil;
			}
		}
	}
	
	public var first: T? {
		get {
			if count > 0 {
				return get(index: 0);
			} else {
				return nil;
			}
		}
	}
}
