//
//  OnlineProvider.swift
//  TransHelper
//
//  Created by sephilex on 2021/5/1.
//

import Foundation
import Moya
import RxSwift
//import CommonError

public class OnlineProvider<Target> where Target: Moya.TargetType {
    private let online: Observable<Bool>
    let moyaProvider: MoyaProvider<Target>
    
    let timeoutClosure = { (timeout: TimeInterval, debugTimeout: TimeInterval) -> Moya.MoyaProvider<Target>.RequestClosure in
        return { (endpoint : Endpoint,
                  closure : MoyaProvider<Target>.RequestResultClosure) -> Void in
            if var urlRequest = try? endpoint.urlRequest() {
                urlRequest.timeoutInterval = timeout
#if DEBUG
                urlRequest.timeoutInterval = debugTimeout
#endif
                closure(.success(urlRequest))
            }
            else{
                closure(.failure(MoyaError.requestMapping(endpoint.url)))
            }

        }
    }
    
    init(stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider<Target>.neverStub,
         plugins: [PluginType] = [],
         trackInflights: Bool = false,
         online: Observable<Bool> = connectedToInternet(),
         timeout: TimeInterval = 5,
         debugTimeout: TimeInterval = 3) {
        self.online = online
        self.moyaProvider = MoyaProvider(requestClosure: timeoutClosure(timeout, debugTimeout),
                                     stubClosure: stubClosure,
                                     plugins: plugins,
                                     trackInflights: trackInflights)
    }
    /// 带网络监测的请求，断线重连
    func request(_ token: Target, retryCount: Int = 1) -> Single<Moya.Response> {
        let actualRequest = moyaProvider.rx.request(token)
        return online.ignore(value: false).take(1)
            .flatMap { _ in
                actualRequest.retry(1).catch { error in
                    Single<Moya.Response>.error(error.asCommonError)
                }
            }.asSingle()
        
    }
}

