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
    func requestRetry(_ target: Target, retryCount: Int) -> Single<Response>
}

extension ApiProtocol {
    
    /// 实际请求方法，可重写改方法以实现更复杂的业务逻辑
    /// - Parameter target:
    /// - Returns:
    public func request(_ target: Target) -> Single<Response> {
        provider.request(target)
    }
    /// 实际请求方法，失败重试，默认三次，可重写改方法以实现更复杂的业务逻辑
    /// - Parameter target:
    /// - Returns:
    public func requestRetry(_ target: Target, retryCount: Int = 3) -> Single<Response> {
        provider.request(target, retryCount: retryCount)
    }
}
