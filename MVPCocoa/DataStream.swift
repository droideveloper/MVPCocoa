/*
 * MVPCocoa Copyright (C) 2017 Fatih.
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

public class DataStream {
	
	private var stream: Data;
	private var position: Int;
	
	public init(of stream: Data, position: Int = 0) {
		self.stream = stream;
		self.position = position;
	}
	
	public func read(sizeof: Int = 8192) -> Data? {
		if position < stream.count {
			let next = position + stream.count;
			let chunk = next < stream.count ? next : stream.count;
			let buffer = stream.subdata(in: position..<chunk);
			position = chunk;
			return buffer;
		}
		return nil;
	}
	
	public func seek(to: Int = 0) {
		if to >= 0  && to < stream.count {
			self.position = to;
		}
	}
}
