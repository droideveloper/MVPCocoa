//
//  UITableView+Extension.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 25.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation
import UIKit

extension UITableView: PropertyChangable {
	
	public func notifyItemsChanged(_ index: Int, size: Int) {
		let paths = toIndexPath(index: index, size: size)
		self.reloadRows(at: paths, with: .automatic)
	}
	
	public func notifyItemsRemoved(_ index: Int, size: Int) {
		let paths = toIndexPath(index: index, size: size)
		self.deleteRows(at: paths, with: .automatic)
	}
	
	public func notifyItemsInserted(_ index: Int, size: Int) {
		let paths = toIndexPath(index: index, size: size)
		self.insertRows(at: paths, with: .automatic)
	}
	
	private func toIndexPath(index: Int, size: Int) -> [IndexPath] {
		return (0..<size).map { position in IndexPath(row: position, section: 0) }
	}
}
