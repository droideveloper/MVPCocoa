//
//  UICollectionView+Extension.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 25.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView: PropertyChangable {
	
	public func notifyItemsChanged(_ index: Int, size: Int) {
		let paths = toIndexPath(index: index, size: size)
		self.reloadItems(at: paths)
	}
	
	public func notifyItemsRemoved(_ index: Int, size: Int) {
		let paths = toIndexPath(index: index, size: size)
		self.deleteItems(at: paths)
	}
	
	public func notifyItemsInserted(_ index: Int, size: Int) {
		let paths = toIndexPath(index: index, size: size)
		if index == 0 {
			self.insertItems(at: paths)
		} else {
			self.reloadItems(at: paths)
		}
	}
	
	private func toIndexPath(index: Int, size: Int) -> [IndexPath] {
		return (index..<size).map { position in IndexPath(item: position, section: 0) }
	}
}
