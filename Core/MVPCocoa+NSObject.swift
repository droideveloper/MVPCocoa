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

extension NSObject {
	
	public func log(message: String) {
		log(level: .Debug, message: message);
	}
	
	public func log(error: Error) {
		log(level: .Error, message: "\(error.localizedDescription)");
	}
	
	public func log(level: Level, message str: String) {
		if let delegate = self as? LogType {
			if delegate.isLogEnabled() {
				print("\(level.description)\(delegate.getClassTag()): \(str)");
			}
		}
	}
}
