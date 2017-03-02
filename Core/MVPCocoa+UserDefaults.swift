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

import ObjectMapper

extension UserDefaults {
	
	/*INTERNAL START*/
	internal func integer(_ key: String) -> Int? {
		let value = self.integer(forKey: key);
		return value == 0 ? nil : value;
	}
	
	internal func float(_ key: String) -> Float? {
		let value = self.float(forKey: key);
		return value == 0 ? nil : value;
	}
	
	internal func double(_ key: String) -> Double? {
		let value = self.double(forKey: key);
		return value == 0 ? nil : value;
	}
	
	internal func bool(_ key: String) -> Bool? {
		if let _ = object(forKey: key) {
			return bool(forKey: key);
		}
		return nil;
	}
	/*INTERNAL END*/
	
	private var `defaults`: UserDefaults {
		get {
			return UserDefaults.standard;
		}
	}
	
	/*PUBLIC START*/
	public func string(for key: String, defaultValue: String = "") -> String {
		return defaults.string(forKey: key) ?? defaultValue;
	}
	
	public func integer(for key: String, defaultValue: Int = 0) -> Int {
		return defaults.integer(key) ?? defaultValue;
	}
	
	public func float(for key: String, defaultValue: Float = 0) -> Float {
		return defaults.float(key) ?? defaultValue;
	}
	
	public func double(for key: String, defaultValue: Double = 0) -> Double {
		return defaults.double(key) ?? defaultValue;
	}
	
	public func bool(for key: String, defaultValue: Bool = false) -> Bool {
		return defaults.bool(key) ?? defaultValue;
	}
	
	public func dictionary(for key: String, defaultValue: [String: Any] = [:]) -> [String: Any] {
		return defaults.dictionary(forKey: key) ?? defaultValue;
	}
	
	public func array(for key: String, defaultValue: [Any] = []) -> [Any] {
		return defaults.array(forKey: key) ?? defaultValue;
	}
	
	public func object(for key: String, defaultValue: Any) -> Any {
		return defaults.object(forKey: key) ?? defaultValue;
	}
	
	public func object<T: Mappable>(for key: String, defaultValue: T) -> T {
		if let json = defaults.dictionary(forKey: key) {
			return Mapper<T>().map(JSON: json) ?? defaultValue;
		}
		return defaultValue;
	}
	
	public func array<T: Mappable>(for key: String, defaultValue: [T] = []) -> [T] {
		if let jsonArray = array(for: key) as? [[String: Any]] {
			var array = [T]();
			for json in jsonArray {
				if let obj = Mapper<T>().map(JSON: json) {
					array.add(item: obj);
				}
			}
			return array.size() > 0 ? array : defaultValue;
		}
		return defaultValue;
	}
}
