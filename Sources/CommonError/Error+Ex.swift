//
//  Error+Ex.swift
//  Project
//
//  Created by sephilex on 2022/6/21.
//

import Alamofire
import Foundation
import Moya
import SwifterSwift

extension Error {
    public var asCommonError: CommonError {
        if let ae = self as? CommonError {
            return ae
        }else if let compatible = self as? CommonErrorCompatible {
            return compatible.commonError
        }else {
            return .error(0, self.localizedDescription)
        }
    }
}

extension AFError: CommonErrorCompatible {
    public var commonError: CommonError {
        switch self {
        default:
            return .error(0, self.localizedDescription)
        }
    }
}

extension MoyaError: CommonErrorCompatible {
    public var commonError: CommonError {
        switch self {
        case let .underlying(error, _):
            return (error as? CommonErrorCompatible)?.commonError ?? .error(0, error.localizedDescription)
        case let .statusCode(response):
            return .error(response.statusCode, response.data.string(encoding: .utf8))
        case let .objectMapping(error, _):
            return .error(0, error.localizedDescription)
        default:
            return .error(0, self.localizedDescription)
        }
    }
}

//extension NSError: CommonErrorCompatible {
//    public var commonError: CommonError {
//        return .error(0, self.localizedDescription)
//    }
//}
