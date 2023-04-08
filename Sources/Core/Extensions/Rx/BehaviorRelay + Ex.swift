//
//  BehaviorRelay + Ex.swift
//  DevKit
//
//  Created by sephilex on 2022/6/26.
//

import RxSwift
import RxCocoa

extension BehaviorRelay {
    public func trigger() {
        accept(() as! Element)
    }
}

extension PublishRelay {
    public func trigger() {
        accept(() as! Element)
    }
}
