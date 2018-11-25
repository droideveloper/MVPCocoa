//
//  PropertyChangable.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 25.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation

public protocol PropertyChangable: class {
	
	func notifyItemsRemoved(_ index: Int, size: Int)
	func notifyItemsInserted(_ index: Int, size: Int)
	func notifyItemsChanged(_ index: Int, size: Int)
}
