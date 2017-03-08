/*
 * MVPCocoa Copyright (C) 2016 Fatih.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import UIKit

import Material

open class AbstractTableAdapter<T>: NSObject, UITableViewDataSource {
	
	open var dataSource: [T];
	
	public init(dataSource: [T] = []) {
		self.dataSource = dataSource;
	}
	
	open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataSource.count;
	}
	
	open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let key = identifierAt(indexPath.row);
		let view = tableView.dequeueReusableCell(withIdentifier: key, for: indexPath);
		if let viewHolder = view as? AbstractTableViewHolder<T> {
			let item = itemAt(indexPath.row);
			self.viewHolder(viewHolder, item: item);
		}
		return view;
	}
	
	open func itemAt(_ index: Int) -> T {
		return dataSource[index];
	}
	
	open func identifierAt(_ index: Int) -> String {
		return "kUnidentifierTablewViewCell";
	}
	
	open func viewHolder(_ viewHolder: AbstractTableViewHolder<T>, item: T) {
		viewHolder.item = item;
	}
}
