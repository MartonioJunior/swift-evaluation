//
//  TestReason+Tests.swift
//  Equatable
//
//  Created by Martônio Júnior on 15/09/2025.
//

@testable import Evaluation
import Testing

struct TestReasonTests {

    // MARK: Self: CustomStringConvertible
    struct ConformsToCustomStringConvertible {
        @Test("Returns message of the player", arguments: [
            (TestReason.custom("This test should work!"), "This test should work!"),
            (TestReason.empty, "COMPONENT INITIALIZED WITHOUT PARAMETERS"),
            (TestReason.incomplete, "INCOMPLETE TEST"),
            (TestReason.invalidSystemUnderTest, "SYSTEM UNDER TEST IS INVALID"),
            (TestReason.notImplemented, "TEST NOT IMPLEMENTED"),
            (TestReason.untestable, "METHOD/CASE CANNOT BE COVERED BY UNIT TESTS")
        ])
        func description(_ sut: TestReason, expected: String) {
            let result = sut.description
            #expect(result == expected)
        }
    }
}

// MARK: swift-testing Support
@Test("Defines a new test trait", arguments: [
    (TestReason.incomplete, ConditionTrait.disabled("INCOMPLETE TEST"))
])
func disabled(_ reason: TestReason, expected: ConditionTrait) {
    let result = ConditionTrait.disabled(reason)
    #expect(result.comments == expected.comments)
}
