//
//  TableDataSource.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 30.11.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation
import UIKit

open class TableDataSource<D: Equatable>: NSObject, UITableViewDataSource {
	
	private var dataSet: ObservableList<D>
	
	public init(dataSet: ObservableList<D>) {
		self.dataSet = dataSet
	}
	
	public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataSet.count
	}
	
	public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: identifierAt(indexPath), for: indexPath)
		bind(cell, dataSet.get(indexPath.row))
		return cell
	}
	
	open func identifierAt(_ indexPath: IndexPath) -> String {
		return String.empty
	}
	
	open func bind(_ cell: UITableViewCell, _ item: D) {
		//
	}
}
