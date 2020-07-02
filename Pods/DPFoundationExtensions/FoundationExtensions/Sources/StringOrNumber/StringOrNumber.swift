//
//  StringOrNumber.swift
//  FoundationExtensions
//
//  Created by 张鹏 on 2019/12/28.
//  Copyright © 2019 dancewithpeng@gmail.com All rights reserved.
//

import Foundation


/// 字符串或数值
/// - string: 字符串
/// - number: 数值
public enum StringOrNumber {
    case string(String)
    case number(Number)
}

// MARK: - Convenient Using
public extension StringOrNumber {
    
    /// 字符串的值，如果是数值类型，会自动转换成字符串
    var stringValue: String {
        switch self {
        case let .string(strValue):
            return strValue
        case let .number(numValue):
            switch numValue {
            case let .int(intValue):
                return "\(intValue)"
            case let .double(doubleValue):
                return "\(doubleValue)"
            }
        }
    }
    
    /// 数值，如是字符串，会返回nil
    var numberValue: Number? {
        switch self {
        case let .string(strValue):
            if let intValue = Int(strValue) {
                return .int(intValue)
            }
            
            if let doubleValue = Double(strValue) {
                return .double(doubleValue)
            }
            
            return nil
        case let .number(numValue):
            return numValue
        }
    }
    
    /// 整型值
    var intValue: Int? {
        return numberValue?.intValue
    }
    
    /// 浮点型值
    var floatValue: Float? {
        return numberValue?.floatValue
    }
    
    /// 双浮点型值
    var doubleValue: Double? {
        return numberValue?.doubleValue
    }
}

// MARK: - Decodable
extension StringOrNumber: Decodable {
    
    public init(from decoder: Decoder) throws {
        
        let container = try decoder.singleValueContainer()
        
        do {
            let stringValue = try container.decode(String.self)
            self = .string(stringValue)
        } catch DecodingError.typeMismatch {
            let numberValue = try container.decode(Number.self)
            self = .number(numberValue)
        }
    }
}

// MARK: - Encodable
extension StringOrNumber: Encodable {
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .string(stringValue):
            try container.encode(stringValue)
        case let .number(numberValue):
            try container.encode(numberValue)
        }
    }
}

// MARK: - Equatable
extension StringOrNumber: Equatable {
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        switch lhs {
        case let .string(lhsStr):
            
            switch rhs {
            case let .string(rhsStr):
                return lhsStr == rhsStr
            case let .number(rhsNum):
                if let lhsIntValue = Int(lhsStr) {
                    return Number.int(lhsIntValue) == rhsNum
                } else if let lhsDoubleValue = Double(lhsStr) {
                    return Number.double(lhsDoubleValue) == rhsNum
                }
                
                return false
            }
        case let .number(lhsNum):
            
            switch rhs {
            case let .number(rhsNum):
                return lhsNum == rhsNum
            case let .string(rhsStr):
                if let rhsIntValue = Int(rhsStr) {
                    return Number.int(rhsIntValue) == lhsNum
                } else if let rhsDoubleValue = Double(rhsStr) {
                    return Number.double(rhsDoubleValue) == lhsNum
                }
                
                return false
            }
        }
    }
}

// MARK: - Expressible Literal
extension StringOrNumber: ExpressibleByStringLiteral, ExpressibleByIntegerLiteral, ExpressibleByFloatLiteral {
    public typealias StringLiteralType = String
    public typealias IntegerLiteralType = Int
    public typealias FloatLiteralType = Double
    
    public init(stringLiteral value: Self.StringLiteralType) {
        self = .string(value)
    }
    
    public init(integerLiteral value: Self.IntegerLiteralType) {
        self = .number(.int(value))
    }
    
    public init(floatLiteral value: Self.FloatLiteralType) {
        self = .number(.double(value))
    }
}

// MARK: - CustomStringConvertible
extension StringOrNumber: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case let .string(stringValue):
            return stringValue.description
        case let .number(numberValue):
            return numberValue.description
        }
    }
}
