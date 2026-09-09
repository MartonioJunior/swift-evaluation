//
//  Untestable.swift
//  Evaluation
//
//  Created by Martônio Júnior on 09/09/2026.
//

#if canImport(Testing)
public import Testing

/// Cancels the current test or test case due to untestable code.
/// - Parameters:
///   - comment: A comment describing why it's untestable.
///   - sourceLocation: The source location to which the testing library will attribute the cancellation.
/// - Throws: An error indicating that the current test or test case has been cancelled. The testing library does not treat this error as a test failure.
public func untestable(_ comment: Comment? = nil, sourceLocation: SourceLocation = #_sourceLocation) throws {
    try Test.cancel(.untestable(comment: comment), sourceLocation: sourceLocation)
}
#endif
