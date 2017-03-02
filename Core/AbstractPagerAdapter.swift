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

open class AbstractPagerAdapter<T, P>: NSObject, UIPageViewControllerDataSource where P: PresenterType {

	open var dataSource: [T]?;
	
	open func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
		if let viewController = viewController as? AbstractPageViewHolder<T, P> {
			if viewController.position ?? 0 > 0 {
				return viewControllerAtIndex(index: viewController.position ?? 0 - 1);
			}
		}
		return nil;
	}
	
	open func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
		if let viewController = viewController as? AbstractPageViewHolder<T, P> {
			let size = dataSource?.size() ?? 0;
			if viewController.position ?? 0 < size - 1 {
				return viewControllerAtIndex(index: viewController.position ?? 0 + 1);
			}
		}
		return nil;
	}
	
	open func itemAtIndex(index: Int) -> T? {
		return nil;
	}
	
	open func viewControllerAtIndex(index: Int) -> AbstractPageViewHolder<T, P>? {
		return nil;
	}
	
	open func title(index: Int) -> String? {
		return nil;
	}
}
