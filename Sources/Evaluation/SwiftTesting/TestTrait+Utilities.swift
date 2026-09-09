//
//  TestTrait+Utilities.swift
//  Evaluation
//
//  Created by Martônio Júnior on 09/09/2026.
//

#if canImport(Testing)
public import Testing

public extension TestTrait where Self == ConditionTrait {
    /// Constructs a condition trait that disables a test unconditionally due to it's implementation being incomplete.
    /// 
    /// This is used to avoid false positives or execution of unintended evaluations.
    static var incomplete: Self {
        .disabled("Test implementation is currently incomplete.")
    }
    /// Constructs a condition trait that disables a test unconditionally due to the test not being implemented, only declared.
    /// 
    /// Different from `Comment.notImplemented`, it focuses on the implementation of the test itself, not the system under test.
    static var notImplemented: Self {
        .disabled("Test or test case was not yet implemented.")
    }
}
#endif
