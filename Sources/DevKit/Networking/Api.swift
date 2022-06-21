//
//  Api.swift
//  Project
//
//  Created by sephilex on 2022/3/6.
//

import Foundation
import RxSwift
import Moya

public class Api: ApiProtocol {
    
    public static var `default` = Api()
    public typealias Target = MultiTarget
    public var provider: OnlineProvider<Target>
    
    required public init(stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider<Target>.neverStub,
                  plugins: [PluginType] = [],
                  trackInflights: Bool = false,
                  online: Observable<Bool> = connectedToInternet(),
                  timeout: TimeInterval = 5,
                  debugTimeout: TimeInterval = 2) {
        provider = OnlineProvider<Target>()
//        provider = OnlineProvider<Target>(stubClosure: MoyaProvider.neverStub(_:), online: .just(true))
//        provider = OnlineProvider<Target>(stubClosure: MoyaProvider.delayedStub(1),
//                                          //                              stubClosure: MoyaProvider.immediatelyStub,
//                                                                             online: .just(true))
    }
}

extension Api {
    public func requestVoid(_ target: Target) -> Single<Void> {
         request(target).mapToVoid().observe(on: MainScheduler.instance)
    }
    
    public func requestString(_ target: Target,
                        keyPath: String? = nil) -> Single<String> {
        request(target).mapString(atKeyPath: keyPath).observe(on: MainScheduler.instance)
    }
    
    public func requestObject<T: Codable>(_ target: Target,
                                        type: T.Type,
                                     keyPath: String? = nil) -> Single<T> {
         request(target).map(type, atKeyPath: keyPath).observe(on: MainScheduler.instance)
    }
    
    public func requestVoidRetry(_ target: Target) -> Single<Void> {
         requestRetry(target).mapToVoid().observe(on: MainScheduler.instance)
    }
    
    public func requestStringRetry(_ target: Target,
                        keyPath: String? = nil) -> Single<String> {
        requestRetry(target).mapString(atKeyPath: keyPath).observe(on: MainScheduler.instance)
    }
    
    public func requestObjectRetry<T: Codable>(_ target: Target,
                                        type: T.Type,
                                     keyPath: String? = nil) -> Single<T> {
        requestRetry(target).map(type, atKeyPath: keyPath).observe(on: MainScheduler.instance)
    }
}
