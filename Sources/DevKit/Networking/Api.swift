//
//  Api.swift
//  Project
//
//  Created by sephilex on 2022/3/6.
//

import Foundation
import RxSwift
import Moya
import RxSwiftExt

public class Api: ApiProtocol {
    
    public static var `default` = Api()
    public typealias Target = MultiTarget
    public var provider: OnlineProvider<Target>
    
    required public init(stubClosure    : @escaping MoyaProvider<Target>.StubClosure = MoyaProvider<Target>.neverStub,
                         plugins        : [PluginType]                               = [],
                         trackInflights : Bool                                       = false,
                         online         : Observable<Bool>                           = connectedToInternet(),
                         timeout        : TimeInterval                               = 5,
                         debugTimeout   : TimeInterval                               = 2) {
        provider = OnlineProvider<Target>(stubClosure    : stubClosure,
                                          plugins        : plugins,
                                          trackInflights : trackInflights,
                                          online         : online,
                                          timeout        : timeout,
                                          debugTimeout   : debugTimeout)
    }
}

extension Api {
    public func requestVoid(_ target: Target) -> Single<Void> {
        request(target).mapToVoid().observe(on: MainScheduler.instance)
//        request(target).map{ _ in }.observe(on: MainScheduler.instance)
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
    
    public func requestVoidRetry(_ target: Target, retryCount: Int = 3) -> Single<Void> {
        requestRetry(target, retryCount: 3).mapToVoid().observe(on: MainScheduler.instance)
    }
    
    public func requestStringRetry(_ target: Target,
                                   keyPath: String? = nil,
                                   retryCount: Int = 3) -> Single<String> {
        requestRetry(target, retryCount: 3).mapString(atKeyPath: keyPath).observe(on: MainScheduler.instance)
    }
    
    public func requestObjectRetry<T: Codable>(_ target: Target,
                                               type: T.Type,
                                               keyPath: String? = nil,
                                               retryCount: Int = 3) -> Single<T> {
        requestRetry(target, retryCount: 3).map(type, atKeyPath: keyPath).observe(on: MainScheduler.instance)
    }
}
