//
//  ObservableType+Response.swift
//  TransHelper
//
//  Created by sephilex on 2021/5/1.
//

import Foundation
import RxSwift
import Moya

//public extension ObservableType where Element == Response {
//
//    /// 过滤json中非200的响应，解析为ErrorModel失败则返回原Response
//    /// - Returns: Observable<Response> 或 Observable.error<ErrorModel>
//    func filter200InModelSuccess() -> Observable<Element> {
//
//        return flatMap { (response) -> Observable<Element> in
//            if 200 == response.statusCode {
//                do {
//                    if let body = try response.mapJSON() as? [String: Any],
//                       let error = Mapper<CNSApiError<String>>().map(JSON: body) {
//                        if error.code != nil && error.code != 200 {
//                            return Observable.error(error)
//                        }
//                    }
//                } catch {
//                    return Observable.just(response)
//                }
//            }
//            return Observable.just(response)
//        }
//    }
//
//}
