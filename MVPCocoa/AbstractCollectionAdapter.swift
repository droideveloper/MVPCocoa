/*
 * MVPCocoa Copyright (C) 2017 Fatih.
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

open class AbstractCollectionAdapter<D>: NSObject, CollectionViewDataSource {

	open var dataSource: [D] {
		didSet {
			dataSourceItems = dataSource.map { item in
				return collectionDataSource(forItem: item);
			}
		}
	}
	
	public private(set) var dataSourceItems: [DataSourceItem];
	
	public init(dataSource: [D] = [], dataSourceItems: [DataSourceItem] = []) {
		self.dataSource = dataSource;
		self.dataSourceItems = dataSourceItems;
	}
	
	open func collectionDataSource(forItem item: D) -> DataSourceItem {
		return DataSourceItem(data: item, width: 0, height: 0);
	}
	
	open func identifierAt(_ index: Int) -> String {
		return "kUnidentifierCollectionViewCell";
	}
	
	open func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return dataSource.count;
	}
	
	open func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let key = identifierAt(indexPath.row);
		let view = collectionView.dequeueReusableCell(withReuseIdentifier: key, for: indexPath);
		if let viewHolder = view as? AbstractCollectionViewHolder<D> {
			let item = itemAt(indexPath.row);
			self.viewHolder(viewHolder, item: item);
		}
		return view;
	}
	
	open func itemAt(_ index: Int) -> D {
		return dataSource[index];
	}
	
	open func viewHolder(_ viewHolder: AbstractCollectionViewHolder<D>, item: D) {
		viewHolder.item = item;
	}
}
