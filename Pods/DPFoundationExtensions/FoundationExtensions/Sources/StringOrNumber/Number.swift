//
//  Number.swift
//  FoundationExtensions
//
//  Created by 张鹏 on 2019/12/28.
//  Copyright © 2019 dancewithpeng@gmail.com All rights reserved.
//

import Foundation


/// 数值
/// - int: 整型
/// - double: 双浮点型
public enum Number {
    case int(Int)
    case double(Double)
}

// MARK: - Number Convenient Using
public extension Number {
    
    /// 整型值
    var intValue: Int {
        switch self {
        case let .int(intValue):
            return intValue
        case let .double(doubleValue):
            return Int(doubleValue)
        }
    }
    
    /// 浮点型值
    var floatValue: Float {
        switch self {
        case let .int(intValue):
            return Float(intValue)
        case let .double(doubleValue):
            return Float(doubleValue)
        }
    }
    
    /// 双浮点型值
    var doubleValue: Double {
        switch self {
        case let .int(intValue):
            return Double(intValue)
        case let .double(doubleValue):
            return doubleValue
        }
    }
}

// MARK: - Number Decodable
extension Number: Decodable {
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        
        do {
            let intValue = try container.decode(Int.self)
            self = .int(intValue)
        } catch DecodingError.dataCorrupted {
            let doubleValue = try container.decode(Double.self)
            self = .double(doubleValue)
        }
    }
}

// MARK: - Number Encodable
extension Number: Encodable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .int(intValue):
            try container.encode(intValue)
        case let .double(doubleValue):
            try container.encode(doubleValue)
        }
    }
}

// MARK: - Number Equatable
extension Number: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.doubleValue == rhs.doubleValue
    }
}

extension Number: Comparable {
    public static func < (lhs: Number, rhs: Number) -> Bool {
        return lhs.doubleValue < rhs.doubleValue
    }
}

// MARK: - Expressibl Literal
extension Number: ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public typealias IntegerLiteralType = Int
    public typealias FloatLiteralType = Double
    
    public init(integerLiteral value: Self.IntegerLiteralType) {
        self = .int(value)
    }
    
    public init(floatLiteral value: Self.FloatLiteralType) {
        self = .double(value)
    }
}

// MARK: - Number CustomStringConvertible
extension Number: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case let .int(intValue):
            return intValue.description
        case let .double(doubleValue):
            return doubleValue.description
        }
    }
}
