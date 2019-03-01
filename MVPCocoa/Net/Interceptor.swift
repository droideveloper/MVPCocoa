//
//  Interceptor.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 2.03.2019.
//  Copyright © 2019 Open Source. All rights reserved.
//

import Foundation

public protocol Interceptor {
	
	func intercept(_ request: URLRequest) -> URLRequest
}
