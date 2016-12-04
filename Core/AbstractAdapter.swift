/*
 * Core Copyright (C) 2016 Fatih.
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

open class AbstractAdapter<T, V>: NSObject, UITableViewDataSource where V: AbstractViewHolder<T> {
	
	open var dataSource: [T]?;
	
	open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return dataSource?.size() ?? 0;
	}
	
	open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let key = identifier(indexPath.row)!;
		let view = tableView.dequeueReusableCell(withIdentifier: key, for: indexPath);
		if let holder = view as? V {
			viewHolder(holder, data: dataSource?.get(index: indexPath.row));
		}
		return view;
	}
	
	open func itemAtIndex(_ index: Int) -> T? {
		return nil;
	}
	
	open func identifier(_ index: Int) -> String? {
		return nil;
	}
	
	open func viewHolder(_ viewHolder: V?, data: T?) {
		viewHolder?.item = data;
	}
}
