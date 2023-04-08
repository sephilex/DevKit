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
    
    required public init(stub           : Bool             = false,
                         plugins        : [PluginType]     = [],
                         trackInflights : Bool             = false,
                         online         : Observable<Bool> = connectedToInternet(),
                         timeout        : TimeInterval     = 5,
                         debugTimeout   : TimeInterval     = 2,
                         delay          : TimeInterval     = 2) {
        let stubClosure = stub ? MoyaProvider<Target>.delayedStub(delay) : MoyaProvider<Target>.neverStub
        provider = OnlineProvider<Target>(stubClosure    : stubClosure,
                                          plugins        : plugins,
                                          trackInflights : trackInflights,
                                          online         : online,
                                          timeout        : timeout,
                                          debugTimeout   : debugTimeout)
    }
}
