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
	
	public func write(url: URL, callback: @escaping (Int64, Int64) -> Void) throws {
		if url.exists {
			if let handle = try? FileHandle(forWritingTo: url) {
				handle.seekToEndOfFile();
				var index = 8192;
				while let buffer = read() {
					handle.write(buffer);
					index += buffer.count;
					callback(Int64(index), Int64(stream.count));
				}
				handle.closeFile();
			}
		} else {
			if let buffer = read() {
				try buffer.write(to: url);
				callback(Int64(8192), Int64(stream.count));
				try write(url: url, callback: callback);
			}
		}
	}
}

extension URL {
	var exists: Bool {
		get {
			let manager = FileManager.default;
			return manager.fileExists(atPath: self.path);
		}
	}
}
