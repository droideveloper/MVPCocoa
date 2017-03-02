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

public class Regex {
	
	private let regex: NSRegularExpression;
	private let pattern: String;
	
	public init(_ pattern: String) {
		self.pattern = pattern;
		self.regex = try! NSRegularExpression(pattern: pattern, options: .caseInsensitive);
	}
	
	public func test(_ input: String) -> Bool {
		let match = regex.matches(in: input, options: [], range: NSRange(location: 0, length: input.characters.count));
		return match.count > 0;
	}
}
