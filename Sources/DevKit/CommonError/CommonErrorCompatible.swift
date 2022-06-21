//
//  CommonErrorCompatible.swift
//  Project
//
//  Created by sephilex on 2022/6/21.
//

import Foundation

public protocol CommonErrorCompatible: Error {
    var commonError: CommonError { get }
}

extension CommonErrorCompatible {
    public var commonError: CommonError {
        .error(0, nil)
    }
}
