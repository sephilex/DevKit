//
//  UICollectionView+ex.swift
//  Project
//
//  Created by sephilex on 2022/4/16.
//

import UIKit
import RxDataSources
import RxSwift
import RxCocoa

public extension Reactive where Base: UICollectionView {
    
    func itemSelected<CommonSection>(dataSource: CollectionViewSectionedDataSource<CommonSection>) -> ControlEvent<CommonSection.Item> {
        let source = self.itemSelected.map { indexPath in
            dataSource[indexPath]
        }
        return ControlEvent(events: source)
    }
    
}
