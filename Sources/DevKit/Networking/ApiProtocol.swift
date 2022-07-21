//
//  BaseApiService.swift
//  TransHelper
//
//  Created by sephilex on 2021/10/13.
//

import Foundation
import Moya
import RxSwift

public protocol ApiProtocol {
    
    associatedtype Target: TargetType
    var provider: OnlineProvider<Target> { get }
    init(stub           : Bool,
         plugins        : [PluginType],
         trackInflights : Bool,
         online         : Observable<Bool>,
         timeout        : TimeInterval,
         debugTimeout   : TimeInterval,
         delay          : TimeInterval)
}

public protocol ApiRequest {
    associatedtype Target: TargetType
    func request(_ target: Target, retryCount: Int) -> Single<Response>
}
