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
    init(stubClosure: @escaping MoyaProvider<Target>.StubClosure,
         plugins: [PluginType],
         trackInflights: Bool,
         online: Observable<Bool>,
         timeout: TimeInterval,
         debugTimeout: TimeInterval)
    func request(_ target: Target) -> Single<Response>
    // 请求超时重发
    func requestRetry(_ target: Target) -> Single<Response>
}

extension ApiProtocol {
    
    public func request(_ target: Target) -> Single<Response> {
        provider.request(target)
    }
    
    public func requestRetry(_ target: Target) -> Single<Response> {
        provider.request(target, retryCount: 3)
    }
}
