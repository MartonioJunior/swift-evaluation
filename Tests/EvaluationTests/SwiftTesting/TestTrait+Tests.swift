//
//  TestTrait+Tests.swift
//  Evaluation
//
//  Created by Martônio Júnior on 09/09/2026.
//

@testable import Evaluation
import Testing

struct TestTraitTests {
    @Test("Compile-time test of an incomplete test case", .incomplete)
    func incomplete() {}
    @Test("Compile-time test of a not implemented test case", .notImplemented)
    func notImplemented() {}

    @Test("Tests new constants for disabling traits", arguments: [
        (ConditionTrait.incomplete, ConditionTrait.disabled("Test implementation is currently incomplete.")),
        (ConditionTrait.notImplemented, ConditionTrait.disabled("Test or test case was not yet implemented."))
    ])
    func disabledConstants(_ sut: ConditionTrait, expected: ConditionTrait) {
        #expect(sut.comments == expected.comments)
    }
}
