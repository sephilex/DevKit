//
//  CodableExtension.swift
//  Project
//
//  Created by sephilex on 2022/6/16.
//

import Foundation


/// 枚举类型Codable扩展，不存在类型时默认赋值最后一个枚举
protocol CaseIterableDefaultsLast: Encodable & Decodable & CaseIterable & RawRepresentable where RawValue: Decodable, AllCases: BidirectionalCollection {}

extension CaseIterableDefaultsLast {
    init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? Self.allCases.last!
    }
}
