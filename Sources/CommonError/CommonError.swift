//
//  Error.swift
//  Project
//
//  Created by sephilex on 2022/3/8.
//

import Foundation


public enum CommonError: Error {
    case error(Int=0, String?)
}

extension CommonError: CustomNSError {
    public var errorCode: Int {
        switch self {
        case let .error(code, _): return code
        }
    }
}

extension CommonError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case let .error(_, message): return message
        }
    }
}

extension CommonError: Equatable {
    public static func == (lhs: CommonError, rhs: CommonError) -> Bool {
        switch (lhs, rhs) {
        case (.error(let left, _), .error(let right, _)):
            return left == right
        }
    }
}

//extension CommonError {
//    public var isNetwork: Bool {
//        self == .network
//    }
//    public var displayImage: UIImage? {
//        if self.isNetwork {
//            return R.image.errorNetwork()
//        }
//        return nil
//    }
//}
