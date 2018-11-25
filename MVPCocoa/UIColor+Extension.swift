//
//  UIColor+Extension.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 25.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation

extension UIColor {
	
	public static func convert(_ hex: Int) -> UIColor {
		return convert(hex.red, hex.green, hex.blue)
	}
	
	public static func convert(_ red: Int, _ green: Int, _ blue: Int) -> UIColor {
		return convert(red, green, blue, 1)
	}
	
	public static func convert(_ red: Int, _ green: Int, _ blue: Int, _ alpha: Int) -> UIColor {
		return UIColor(red: red.colorChannel,
									 green: green.colorChannel,
									 blue: blue.colorChannel,
									 alpha: alpha.colorChannel)
	}
}
