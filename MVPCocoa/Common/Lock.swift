//
//  Lock.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 9.08.2019.
//  Copyright © 2019 Open Source. All rights reserved.
//

import Foundation

protocol Lock {
	func hold()
	func release()
}
