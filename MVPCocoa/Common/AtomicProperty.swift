//
//  AtomicProperty.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 9.08.2019.
//  Copyright © 2019 Open Source. All rights reserved.
//

import Foundation

class AtomicProperty<T> {
	
	private var obj = SpinLock()
	private var _value: T
	
	var value: T {
		
		get {
			obj.hold()
			let property = self._value
			obj.release()
			return property
		}
		
		set {
			obj.hold()
			self._value = newValue
			obj.release()
		}
	}
	
	
	init(defaultValue: T) {
		self._value = defaultValue
	}
}
