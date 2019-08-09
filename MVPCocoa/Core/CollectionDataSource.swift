//
//  CollectionDataSource.swift
//  MVPCocoa
//
//  Created by Fatih Şen on 1.12.2018.
//  Copyright © 2018 Open Source. All rights reserved.
//

import Foundation
import RxSwift
import UIKit

open class CollectionDataSource<D: Equatable>: NSObject, UICollectionViewDataSource {
	
	private var lastCount: AtomicProperty<Int>
	private var dataSet: ObservableList<D>
	
	private var emitter: AnyObserver<Bool>? = nil
	
	public lazy var loadMoreObservable: Observable<Bool> = {
		return Observable.create { emitter in
			self.emitter = emitter
			return Disposables.create()
		}
	}()
	
	private let loadMoreDistance: Int
	
	public init(dataSet: ObservableList<D>, _ loadMoreDistance: Int = 5) {
		self.dataSet = dataSet
		self.lastCount = AtomicProperty<Int>(defaultValue: dataSet.count)
		self.loadMoreDistance = loadMoreDistance
	}
	
	public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return dataSet.count
	}
	
	public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifierAt(indexPath), for: indexPath)
		bind(cell, dataSet.get(indexPath.item))
		
		let lastCount = self.lastCount.value
		if lastCount != dataSet.count {
			let diff = dataSet.count - indexPath.item
			let hasLoadMore = diff <= loadMoreDistance
			if hasLoadMore {
				self.lastCount.value = dataSet.count
				emitter?.onNext(hasLoadMore)
			}
		}

		return cell
	}
	
	open func bind(_ cell: UICollectionViewCell, _ item: D) {
		// override this
	}
	
	open func identifierAt(_ indexPath: IndexPath) -> String {
		return String.empty
	}
}
