//
//  UICollectionView+Register.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 4.12.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation
import UIKit

extension UICollectionView {
	
	public func register<T>(types: T.Type...) where T: UITableViewCell {
		register(types: types)
	}
	
	private func register<T>(types: [T.Type]) where T: UITableViewCell {
		types.forEach { type in
			let identifier = String(describing: type)
			register(UINib(nibName: identifier, bundle: Bundle.main), forCellWithReuseIdentifier: identifier)
		}
	}
}
