//
//  Requestable.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 25.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation
import Alamofire

public protocol Requestable {
	
	var baseUrl: String { get }
	var request: URLRequest { get }
}
