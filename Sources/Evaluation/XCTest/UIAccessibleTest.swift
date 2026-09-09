//
//  UIAccessibleTest.swift
//
//
//  Created by Martônio Júnior on 10/10/23.
//

#if canImport(XCTest)
public import XCTest

/// `XCTestCase` specialized for UI accessibility tests.
@available(iOS 17.0.0, macOS 14.0, *)
open class UIAccessibleTest: XCTestCase {
    // MARK: Variables
    /// App executed in the test case. Should only be used by the test class
    public var app: XCUIApplication! // swiftlint:disable:this test_case_accessibility
    // MARK: Initializers
    deinit {}

    // MARK: Setup
    override open func setUp() async throws { // swiftlint:disable:this unneeded_throws_rethrows
        app = await XCUIApplication()
        await app.launch()
    }

    override open func tearDown() async throws {
        continueAfterFailure = true
        try await app.performAccessibilityAudit()
    }
}
#endif
