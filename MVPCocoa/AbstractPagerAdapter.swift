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

open class AbstractPagerAdapter<T>: NSObject, UIPageViewControllerDataSource {

	open var dataSource: [T];
	
	public init(dataSource: [T] = []) {
		self.dataSource = dataSource;
	}
	
	open func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		if let viewController = viewController as? AbstractPageViewHolder<T> {
			let index = viewController.position;
			if index > 0 {
				return viewControllerAt(index: (index + 1));
			}
		}
		return nil;
	}
	
	open func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		if let viewController = viewController as? AbstractPageViewHolder<T> {
			let index = viewController.position;
			if index < (dataSource.count - 1) {
				return viewControllerAt(index: (index + 1));
			}
		}
		return nil;
	}
	
	public func presentationCount(for pageViewController: UIPageViewController) -> Int {
		return dataSource.count;
	}
	
	open func itemAt(index: Int) -> T {
		return dataSource[index];
	}
	
	open func viewControllerAt(index: Int) -> AbstractPageViewHolder<T> {
		return AbstractPageViewHolder<T>(position: index, item: itemAt(index: index));
	}
	
	open func title(index: Int) -> String {
		return "kUnidentifierTitle";
	}
}
