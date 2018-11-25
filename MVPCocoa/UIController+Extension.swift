//
//  UIController+Extension.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 25.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
	
	open func showError(_ message: String, _ style: UIAlertController.Style = .actionSheet, _ completion: (() -> Void)? = nil) {
		let dialog = UIAlertController(title: "Error", message: message, preferredStyle: style)
		dialog.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { _ in dialog.dismiss(animated: true, completion: nil) }))
		present(dialog, animated: true, completion: completion)
	}
}
