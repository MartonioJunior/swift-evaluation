//
//  TestReason.swift
//  Evaluation
//
//  Created by Martônio Júnior on 23/09/23.
//

import Foundation

public enum TestReason {
    // MARK: Cases
    case custom(String)
    case empty
    case incomplete
    case invalidSystemUnderTest
    case notImplemented
    case untestable
}

// MARK: Self: CustomStringConvertible
extension TestReason: CustomStringConvertible {
    public var description: String {
        switch self {
            case .empty: "COMPONENT INITIALIZED WITHOUT PARAMETERS"
            case .incomplete: "INCOMPLETE TEST"
            case .invalidSystemUnderTest: "SYSTEM UNDER TEST IS INVALID"
            case .notImplemented: "TEST NOT IMPLEMENTED"
            case .untestable: "METHOD/CASE CANNOT BE COVERED BY UNIT TESTS"
            case .custom(let message): message
        }
    }
}

// MARK: Self: Sendable
extension TestReason: Sendable {}

// MARK: swift-testing Support
#if canImport(Testing)
import Testing

public extension TestTrait where Self == ConditionTrait {
    static func disabled(_ reason: TestReason) -> Self {
        .disabled(.init(stringLiteral: reason.description))
    }
}
#endif
