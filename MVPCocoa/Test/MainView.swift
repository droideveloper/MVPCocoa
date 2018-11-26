//
//  MainView.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 26.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation
import RxSwift

public protocol MainView: View {	
	func observeTextChange() -> Observable<String>
}
