//
//  ConcurrentDispatcher.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 29.04.2019.
//  Copyright © 2019 Open Source. All rights reserved.
//

import Foundation
import RxSwift

public class ConcurrentDispatcher {
	
	public static let instance = ConcurrentDispatchQueueScheduler(qos: .userInitiated)
}
