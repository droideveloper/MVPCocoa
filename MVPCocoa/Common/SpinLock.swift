//
//  SpinLock.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 9.08.2019.
//  Copyright © 2019 Open Source. All rights reserved.
//

import Foundation

class SpinLock: Lock {
	
	private var obj = os_unfair_lock_s()

	func hold() {
		os_unfair_lock_lock(&obj)
	}
	
	func release() {
		os_unfair_lock_unlock(&obj)
	}
}
