//
//  UIAccessibleTest.swift
//
//
//  Created by Martônio Júnior on 10/10/23.
//

import Foundation

#if canImport(XCTest)
import XCTest

@available(iOS 17.0.0, *)
@available(macOS 14.0, *)
open class UIAccessibleTest: XCTestCase {
    // MARK: Variables
    public var app: XCUIApplication!

    // MARK: Initializers
    deinit {}

    // MARK: Setup
    override open func setUp() async throws {
        app = await XCUIApplication()
        await app.launch()
    }

    override open func tearDown() async throws {
        continueAfterFailure = true
        try await app.performAccessibilityAudit()
    }
}
#endif
