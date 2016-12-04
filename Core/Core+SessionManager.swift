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

import Alamofire
import ObjectMapper

import RxCocoa
import RxSwift

public class RxNet {
	
	public static func urlRequest(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) throws -> Foundation.URLRequest {
		var mutableRequest = Foundation.URLRequest(url: try url.asURL());
		mutableRequest.httpMethod = method.rawValue;
		if let headers = headers {
			for(field, value) in headers {
				mutableRequest.addValue(value, forHTTPHeaderField: field);
			}
		}
		if let parameters = parameters {
			mutableRequest = try encoding.encode(mutableRequest, with: parameters);
		}
		return mutableRequest;
	}
	
	public static func request(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<DataRequest> {
		return SessionManager.default.rx.request(method, url, parameters: parameters, encoding: encoding, headers: headers);
	}
	
	public static func requestData(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<(HTTPURLResponse, Data)> {
		return SessionManager.default.rx.requestData(method, url, parameters: parameters, encoding: encoding, headers: headers);
	}
	
	public static func data(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<Data> {
		return SessionManager.default.rx.data(method, url, parameters: parameters, encoding: encoding, headers: headers);
	}
	
	public static func requestString(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<(HTTPURLResponse, String)> {
		return SessionManager.default.rx.requestString(method, url, parameters: parameters, encoding: encoding, headers: headers);
	}

	public static func string(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<String> {
		return SessionManager.default.rx.string(method, url, parameters: parameters, encoding: encoding, headers: headers);
	}

	public static func requestJSON(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<(HTTPURLResponse, Any)> {
		return SessionManager.default.rx.requestJSON(method, url, parameters: parameters, encoding: encoding, headers: headers);
	}
	
	public static func json(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<Any> {
		return SessionManager.default.rx.json(method, url, parameters: parameters, encoding: encoding, headers: headers);
	}

	public static func requestObject<T: BaseMappable>(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<(HTTPURLResponse, T)> {
		return SessionManager.default.rx.requestObject(method, url, parameters: parameters, encoding: encoding, headers: headers);
	}
	
	public static func object<T: BaseMappable>(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<T> {
		return SessionManager.default.rx.object(method, url, parameters: parameters, encoding: encoding, headers: headers);
	}

	public static func requestArray<T: BaseMappable>(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<(HTTPURLResponse, [T])> {
		return SessionManager.default.rx.requestArray(method, url, parameters: parameters, encoding: encoding, headers: headers);
	}
	
	public static func array<T: BaseMappable>(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<[T]> {
		return SessionManager.default.rx.array(method, url, parameters: parameters, encoding: encoding, headers: headers);
	}
	
	public static func upload(_ file: URL, urlRequest: URLRequestConvertible) -> Observable<UploadRequest> {
		return SessionManager.default.rx.upload(file, urlRequest: urlRequest)
	}
	
	public static func upload(_ data: Data, urlRequest: URLRequestConvertible) -> Observable<UploadRequest> {
		return SessionManager.default.rx.upload(data , urlRequest: urlRequest)
	}
	
	public static func upload(_ stream: InputStream, urlRequest: URLRequestConvertible) -> Observable<UploadRequest> {
		return SessionManager.default.rx.upload(stream, urlRequest: urlRequest)
	}
	
	public static func download(_ urlRequest: URLRequestConvertible, to destination: @escaping DownloadRequest.DownloadFileDestination) -> Observable<DownloadRequest> {
		return SessionManager.default.rx.download(urlRequest, to: destination)
	}
	
	public static func download(resumeData: Data, to destination: @escaping DownloadRequest.DownloadFileDestination) -> Observable<DownloadRequest> {
		return SessionManager.default.rx.download(resumeData: resumeData, to: destination)
	}
}

extension Reactive where Base: URLSession {
	
	public func json(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<Any> {
		do {
			let request = try RxNet.urlRequest(method, url, parameters: parameters, encoding: encoding, headers: headers);
			return json(request: request);
		} catch let error {
			return Observable.error(error);
		}
	}
	
	public func data(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<Data> {
		do {
			let request = try RxNet.urlRequest(method, url, parameters: parameters, encoding: encoding, headers: headers);
			return data(request: request);
		} catch let error {
			return Observable.error(error);
		}
	}
	
	public func response(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<(HTTPURLResponse, Data)> {
		do {
			let request = try RxNet.urlRequest(method, url, parameters: parameters, encoding: encoding, headers: headers);
			return response(request: request);
		} catch let error {
			return Observable.error(error);
		}
	}
}

extension SessionManager: ReactiveCompatible { }

protocol RxRequest {
	func response(withClosure: @escaping (RxResponse) -> Void);
	func restore();
	func discharge();
}

protocol RxResponse {
	var error: Error? { get };
}

extension DefaultDataResponse: RxResponse { }
extension DefaultDownloadResponse: RxResponse { }

extension DataRequest {
	
	enum ErrorCode: Int {
		case noData = 1
		case dataSerializationFailed = 2
	}
	
	internal static func newError(_ code: ErrorCode, failureReason: String) -> NSError {
		let errorDomain = "org.fs.error";
		let userInfo = [NSLocalizedFailureReasonErrorKey: failureReason];
		return NSError(domain: errorDomain, code: code.rawValue, userInfo: userInfo);
	}
	
	public static func ObjectMapperSerializer<T: BaseMappable>(_ keyPath: String?, mapToObject object: T? = nil, context: MapContext? = nil) -> DataResponseSerializer<T> {
		return DataResponseSerializer { request, response, data, error in
			guard error == nil else {
				return .failure(error!)
			}
			
			guard let _ = data else {
				let failureReason = "Data could not be serialized. Input data was nil."
				let error = newError(.noData, failureReason: failureReason)
				return .failure(error)
			}
			
			let jsonResponseSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
			let result = jsonResponseSerializer.serializeResponse(request, response, data, error)
			
			let JSONToMap: Any?
			if let keyPath = keyPath , keyPath.isEmpty == false {
				JSONToMap = (result.value as AnyObject?)?.value(forKeyPath: keyPath)
			} else {
				JSONToMap = result.value
			}
			
			if let object = object {
				_ = Mapper<T>().map(JSONObject: JSONToMap, toObject: object)
				return .success(object)
			} else if let parsedObject = Mapper<T>(context: context).map(JSONObject: JSONToMap){
				return .success(parsedObject)
			}
			
			let failureReason = "ObjectMapper failed to serialize response."
			let error = newError(.dataSerializationFailed, failureReason: failureReason)
			return .failure(error)
		}
	}
	
	@discardableResult
	public func responseObject<T: BaseMappable>(queue: DispatchQueue? = nil, keyPath: String? = nil, mapToObject object: T? = nil, context: MapContext? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
		return response(queue: queue, responseSerializer: DataRequest.ObjectMapperSerializer(keyPath, mapToObject: object, context: context), completionHandler: completionHandler)
	}
	
	public static func ObjectMapperArraySerializer<T: BaseMappable>(_ keyPath: String?, context: MapContext? = nil) -> DataResponseSerializer<[T]> {
		return DataResponseSerializer { request, response, data, error in
			guard error == nil else {
				return .failure(error!)
			}
			
			guard let _ = data else {
				let failureReason = "Data could not be serialized. Input data was nil."
				let error = newError(.dataSerializationFailed, failureReason: failureReason)
				return .failure(error)
			}
			
			let jsonResponseSerializer = DataRequest.jsonResponseSerializer(options: .allowFragments)
			let result = jsonResponseSerializer.serializeResponse(request, response, data, error)
			
			let JSONToMap: Any?
			if let keyPath = keyPath, keyPath.isEmpty == false {
				JSONToMap = (result.value as AnyObject?)?.value(forKeyPath: keyPath)
			} else {
				JSONToMap = result.value
			}
			
			if let parsedObject = Mapper<T>(context: context).mapArray(JSONObject: JSONToMap){
				return .success(parsedObject)
			}
			
			let failureReason = "ObjectMapper failed to serialize response."
			let error = newError(.dataSerializationFailed, failureReason: failureReason)
			return .failure(error)
		}
	}
	
	@discardableResult
	public func responseArray<T: BaseMappable>(queue: DispatchQueue? = nil, keyPath: String? = nil, context: MapContext? = nil, completionHandler: @escaping (DataResponse<[T]>) -> Void) -> Self {
		return response(queue: queue, responseSerializer: DataRequest.ObjectMapperArraySerializer(keyPath, context: context), completionHandler: completionHandler)
	}
}

extension DataRequest: RxRequest {
	
	func response(withClosure: @escaping (RxResponse) -> Void) {
		response(completionHandler: { (response) in
			withClosure(response);
		})
	}
	
	func restore() {
		resume();
	}
	
	func discharge() {
		cancel();
	}
}

extension DownloadRequest: RxRequest {
	
	func response(withClosure: @escaping (RxResponse) -> Void) {
		response(completionHandler: { (response) in
			withClosure(response);
		})
	}
	
	func restore() {
		resume();
	}
	
	func discharge() {
		cancel();
	}
}

extension Reactive where Base: SessionManager {
	
	func request<R: RxRequest>(_ createRequest: @escaping (SessionManager) throws -> R) -> Observable<R> {
		return Observable.create { observer -> Disposable in
			let request: R;
			do {
				request = try createRequest(self.base);
				observer.on(.next(request));
				request.response(withClosure: { (response) in
					if let error = response.error {
						observer.on(.error(error));
					} else {
						observer.on(.completed);
					}
				});
				if !self.base.startRequestsImmediately {
					request.restore();
				}
				return Disposables.create {
					request.discharge();
				}
			} catch let error {
				observer.on(.error(error));
				return Disposables.create();
			}
		}
	}
	
	public func request(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<DataRequest> {
		return request { manager in
			return manager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers);
		};
	}
	
	public func request(urlRequest: URLRequestConvertible) -> Observable<DataRequest> {
		return request { manager in
			return manager.request(urlRequest);
		};
	}
	
	public func requestData(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<(HTTPURLResponse, Data)> {
		return request(method, url, parameters: parameters, encoding: encoding, headers: headers)
			.flatMap { request in
				return request.rx.responseData();
		};
	}
	
	public func data(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<Data> {
		return request(method, url, parameters: parameters, encoding: encoding, headers: headers)
			.flatMap { request in
				return request.rx.data();
		};
	}
	
	public func requestString(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<(HTTPURLResponse, String)> {
		return request(method, url, parameters: parameters, encoding: encoding, headers: headers)
			.flatMap { request in
				return request.rx.responseString();
		};
	}
	
	public func string(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<String> {
		return request(method, url, parameters: parameters, encoding: encoding, headers: headers)
			.flatMap { request in
				return request.rx.string();
		};
	}
	
	public func requestJSON(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<(HTTPURLResponse, Any)> {
		return request(method, url, parameters: parameters, encoding: encoding, headers: headers)
			.flatMap { request in
				return request.rx.responseJSON();
		};
	}
	
	public func json(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<Any> {
		return request(method, url, parameters: parameters, encoding: encoding, headers: headers)
			.flatMap { request in
				return request.rx.json();
		};
	}
	
	public func requestObject<T: BaseMappable>(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<(HTTPURLResponse, T)> {
		return request(method, url, parameters: parameters, encoding: encoding, headers: headers)
			.flatMap { request in
				return request.rx.responseObject();
		};
	}
	
	public func object<T: BaseMappable>(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<T> {
		return request(method, url, parameters: parameters, encoding: encoding, headers: headers)
			.flatMap { request in
				return request.rx.object();
		};
	}
	
	public func requestArray<T: BaseMappable>(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<(HTTPURLResponse, [T])> {
		return request(method, url, parameters: parameters, encoding: encoding, headers: headers)
			.flatMap { request in
				return request.rx.responseArray();
		};
	}
	
	public func array<T: BaseMappable>(_ method: Alamofire.HTTPMethod, _ url: URLConvertible, parameters: [String: Any]? = nil, encoding: ParameterEncoding = URLEncoding.default, headers: [String: String]? = nil) -> Observable<[T]> {
		return request(method, url, parameters: parameters, encoding: encoding, headers: headers)
			.flatMap { request in
				return request.rx.array();
		};
	}
	
	public func upload(_ file: URL, urlRequest: URLRequestConvertible) -> Observable<UploadRequest> {
		return request { manager in
			return manager.upload(file, with: urlRequest);
		};
	}
	
	public func upload(_ data: Data, urlRequest: URLRequestConvertible) -> Observable<UploadRequest> {
		return request { manager in
			return manager.upload(data, with: urlRequest);
		};
	}
	
	public func upload(_ stream: InputStream, urlRequest: URLRequestConvertible) -> Observable<UploadRequest> {
		return request { manager in
			return manager.upload(stream, with: urlRequest);
		};
	}
	
	public func download(_ urlRequest: URLRequestConvertible, to destination: @escaping DownloadRequest.DownloadFileDestination) -> Observable<DownloadRequest> {
		return request { manager in
			return manager.download(urlRequest, to: destination);
		};
	}
	
	public func download(resumeData: Data, to destination: @escaping DownloadRequest.DownloadFileDestination) -> Observable<DownloadRequest> {
		return request { manager in
			return manager.download(resumingWith: resumeData, to: destination);
		};
	}
}

extension Request: ReactiveCompatible { }

extension Reactive where Base: DataRequest {
	
	func validateSuccessfulResponse() -> DataRequest {
		return self.base.validate(statusCode: 200..<300);
	}
	
	public func responseResult<T: DataResponseSerializerProtocol>(queue: DispatchQueue? = nil, responseSerializer: T) -> Observable<(HTTPURLResponse, T.SerializedObject)> {
		return Observable.create { observer in
			let dataRequest = self.base.response(queue: queue, responseSerializer: responseSerializer) { (packedResponse) -> Void in
				switch packedResponse.result {
				case .success(let result):
					if let httpResponse = packedResponse.response {
						observer.on(.next(httpResponse, result));
					} else {
						observer.on(.error(NSError(domain: "RxAlamofire", code: -1, userInfo: nil)));
					}
					observer.on(.completed);
				case .failure(let error):
					observer.on(.error(error));
				}
			}
			return Disposables.create {
				dataRequest.discharge();
			}
		}
	}
	
	public func result<T: DataResponseSerializerProtocol>(queue: DispatchQueue? = nil, responseSerializer: T) -> Observable<T.SerializedObject> {
		return Observable.create { observer in
			let dataRequest = self.validateSuccessfulResponse()
				.response(queue: queue, responseSerializer: responseSerializer) { (packedResponse) -> Void in
					switch packedResponse.result {
					case .success(let result):
						if let _ = packedResponse.response {
							observer.on(.next(result));
						} else {
							observer.on(.error(NSError(domain: "RxAlamofire", code: -1, userInfo: nil)));
						}
						observer.on(.completed);
					case .failure(let error):
						observer.on(.error(error));
					}
			}
			return Disposables.create {
				return dataRequest.discharge();
			}
		}
	}
	
	// ObjectMapper - Array
	public func responseArray<T: BaseMappable>(keyPath: String? = nil, context: MapContext? = nil) -> Observable<(HTTPURLResponse, [T])> {
		return responseResult(responseSerializer: DataRequest.ObjectMapperArraySerializer(keyPath, context: context));
	}
	
	public func array<T: BaseMappable>(keyPath: String? = nil, context: MapContext? = nil) -> Observable<[T]> {
		return result(responseSerializer: DataRequest.ObjectMapperArraySerializer(keyPath, context: context));
	}
	
	// ObjectMapper - Object
	public func responseObject<T: BaseMappable>(keyPath: String? = nil, mapToObject object: T? = nil, context: MapContext? = nil) -> Observable<(HTTPURLResponse, T)> {
		return responseResult(responseSerializer: DataRequest.ObjectMapperSerializer(keyPath, mapToObject: object, context: context));
	}
	
	public func object<T: BaseMappable>(keyPath: String? = nil, mapToObject object: T? = nil, context: MapContext? = nil) -> Observable<T> {
		return result(responseSerializer: DataRequest.ObjectMapperSerializer(keyPath, mapToObject: object, context: context));
	}
	
	// Data
	public func responseData() -> Observable<(HTTPURLResponse, Data)> {
		return responseResult(responseSerializer: DataRequest.dataResponseSerializer());
	}
	
	public func data() -> Observable<Data> {
		return result(responseSerializer: DataRequest.dataResponseSerializer());
	}
	
	// String
	public func responseString(encoding: String.Encoding? = nil) -> Observable<(HTTPURLResponse, String)> {
		return responseResult(responseSerializer: Base.stringResponseSerializer(encoding: encoding));
	}
	
	public func string(encoding: String.Encoding? = nil) -> Observable<String> {
		return result(responseSerializer: Base.stringResponseSerializer(encoding: encoding));
	}
	
	// Json
	public func responseJSON(options: JSONSerialization.ReadingOptions = .allowFragments) -> Observable<(HTTPURLResponse, Any)> {
		return responseResult(responseSerializer: Base.jsonResponseSerializer(options: options));
	}
	
	public func json(options: JSONSerialization.ReadingOptions = .allowFragments) -> Observable<Any> {
		return result(responseSerializer: Base.jsonResponseSerializer(options: options));
	}
	
	// PropertyList
	public func responsePropertyList(options: PropertyListSerialization.ReadOptions = PropertyListSerialization.ReadOptions()) -> Observable<(HTTPURLResponse, Any)> {
		return responseResult(responseSerializer: Base.propertyListResponseSerializer(options: options));
	}
	
	public func propertyList(options: PropertyListSerialization.ReadOptions = PropertyListSerialization.ReadOptions()) -> Observable<Any> {
		return result(responseSerializer: Base.propertyListResponseSerializer(options: options));
	}
	
	public func progress() -> Observable<RxProgress> {
		return Observable.create { observer in
			self.base.downloadProgress { progress in
				let rxProgress = RxProgress(bytesWritten: progress.completedUnitCount, totalBytes: progress.totalUnitCount);
				observer.on(.next(rxProgress));
				if rxProgress.bytesWritten >= rxProgress.totalBytes {
					observer.on(.completed);
				}
			}
			return Disposables.create();
		}.startWith(RxProgress(bytesWritten: 0, totalBytes: 0));
	}
}

extension Reactive where Base: DownloadRequest {
	
	public func progress() -> Observable<RxProgress> {
		return Observable.create { observer in
			self.base.downloadProgress { progress in
				let rxProgress = RxProgress(bytesWritten: progress.completedUnitCount, totalBytes: progress.totalUnitCount);
				observer.on(.next(rxProgress));
				if rxProgress.bytesWritten >= rxProgress.totalBytes {
					observer.on(.completed);
				}
			}
			return Disposables.create();
		}.startWith(RxProgress(bytesWritten: 0, totalBytes: 0));
	}
}

public class RxProgress {
	public let bytesWritten: Int64
	public let totalBytes: Int64
	
	public init(bytesWritten: Int64, totalBytes: Int64) {
		self.bytesWritten = bytesWritten
		self.totalBytes = totalBytes
	}
}

extension RxProgress {
	public var bytesRemaining: Int64 {
		return totalBytes - bytesWritten
	}
	
	public var completed: Float {
		if totalBytes > 0 {
			return Float(bytesWritten) / Float(totalBytes)
		}
		else {
			return 0
		}
	}
}

extension RxProgress: Equatable {}

public func ==(lhs: RxProgress, rhs: RxProgress) -> Bool {
	return lhs.bytesWritten == rhs.bytesWritten &&
		lhs.totalBytes == rhs.totalBytes
}

// JSONArrayEncoding style
public struct JSONArrayEncoding: ParameterEncoding {
	
	//I'm hoping anyone does not use this key in their json tag right =)
	public static let kJsonArrayEncodingParameter = "kJsonArrayEncodingParameter";
	
	private let kContentType = "Content-Type";
	private let vContentType = "application/json; charset=utf-8";
	
	public static var `default`: JSONArrayEncoding {
		return JSONArrayEncoding();
	}
	
	public let options: JSONSerialization.WritingOptions;
	
	public init(options: JSONSerialization.WritingOptions = []) {
		self.options = options;
	}
	
	public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
		var request = try urlRequest.asURLRequest();
		guard let parameters = parameters, let array = parameters[JSONArrayEncoding.kJsonArrayEncodingParameter] else {
			return request;
		}
		do  {
			let data = try JSONSerialization.data(withJSONObject: array, options: options);
			
			if request.value(forHTTPHeaderField: kContentType) == nil {
				request.setValue(vContentType, forHTTPHeaderField: kContentType);
			}
			request.httpBody = data;
			
		} catch {
			throw EmptyResultError.nilResult(detail: "\(error.localizedDescription)");
		}
		return request;
	}
}

// RawValue as Json, String, Int etc. primarily primitives
public struct JSONRawValueEncoding: ParameterEncoding {
	
	//I'm hoping anyone does not use this key in their json tag right =)
	public static let kJsonRawValueEncodingParameter = "kJsonRawValueEncodingParameter";
	
	private let kContentType = "Content-Type";
	private let vContentType = "application/json; charset=utf-8";
	
	public static var `default`: JSONRawValueEncoding {
		return JSONRawValueEncoding();
	}
	
	public let options: JSONSerialization.WritingOptions;
	
	public init(options: JSONSerialization.WritingOptions = []) {
		self.options = options;
	}
	
	public func encode(_ urlRequest: URLRequestConvertible, with parameters: Parameters?) throws -> URLRequest {
		var request = try urlRequest.asURLRequest();
		guard let parameters = parameters, let value = parameters[JSONRawValueEncoding.kJsonRawValueEncodingParameter] else {
			return request;
		}
		do {
			let data = try JSONSerialization.data(withJSONObject: value, options: options);
			if request.value(forHTTPHeaderField: kContentType) == nil {
				request.setValue(vContentType, forHTTPHeaderField: kContentType);
			}
			request.httpBody = data;
		} catch {
			throw EmptyResultError.nilResult(detail: "\(error.localizedDescription)");

		}
		return request;
	}
}

// With this extension only access is allowed
extension Array where Element: Mappable {
	
	public func toJSON() -> [String: Any] {
		let json: [[String: Any]] = self.toJSON();
		return [JSONArrayEncoding.kJsonArrayEncodingParameter: json];
	}
}
