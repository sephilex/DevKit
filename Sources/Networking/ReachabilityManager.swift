//
//  ReachabilityManager.swift
//  TransHelper
//
//  Created by sephilex on 2021/5/1.
//

import RxSwift
import Alamofire
import Toaster
import Core

// An observable that completes when the app gets online (possibly completes immediately).
public func connectedToInternet() -> Observable<Bool> {
    return ReachabilityManager.shared.reach
}

public class ReachabilityManager {

    public static let shared = ReachabilityManager()

    let reachSubject = ReplaySubject<Bool>.create(bufferSize: 1)
    public var reach: Observable<Bool> {
        return reachSubject.asObservable()
    }

    init() {
    }
    
    public func start() {
        NetworkReachabilityManager.default?.startListening(onUpdatePerforming: { (status) in
            let statusString = "网络状态: \(status.description)"
            Log.info(statusString)
            #if DEBUG
            ToastView.appearance().bottomOffsetPortrait = 100
            Toast(text: statusString).show()
            #endif
            switch status {
            case .notReachable:
                self.reachSubject.onNext(false)
            case .reachable:
                self.reachSubject.onNext(true)
            case .unknown:
                self.reachSubject.onNext(false)
            }
        })
    }
}

extension NetworkReachabilityManager.NetworkReachabilityStatus: CustomStringConvertible {
    public var description: String {
        switch self {
        case .unknown: return "未知网络"
        case .notReachable: return "网络不可达"
        case let .reachable(type): return type == .cellular ? "cellular" : "wifi"
        }
    }
}
