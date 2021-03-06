//
//  View.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 25.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation

public protocol View {
	var isAvailable: Bool { get }
	func showError(_ message: String)
	func showError(_ message: String, completion: @escaping () -> Void)
	func showProgress()
	func hideProgress()
}
