//
//  Single+Ex.swift
//  Project
//
//  Created by sephilex on 2022/3/17.
//

import RxSwift
import RxCocoa


extension PrimitiveSequence where Trait == SingleTrait {
    
    func mapToVoid() -> Single<Void> {
        return map { _ in }
    }
}
