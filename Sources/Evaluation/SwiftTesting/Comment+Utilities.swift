//
//  Comment+Utilities.swift
//  Evaluation
//
//  Created by Martônio Júnior on 09/09/2026.
//

#if canImport(Testing)
public import Testing

public extension Comment {
    /// Comment for code that is flaky: usable as is, but is not fully correct and may require changes.
    static var flaky: Comment { "The current implementation is flaky and may require changes in the future." }

    private static func compose(_ message: Comment, withComment comment: Comment?) -> Self {
        var message = message
        if let comment { message.rawValue += ": \(comment)" } else { message.rawValue += "." }
        return message
    }
    /// Comment for tests that indicate a test or test case requires more arguments
    /// to properly cover the execution.
    /// - Parameter comment: A comment describing why the test or test case needs more arguments.
    static func needsMoreArguments(comment: Comment? = nil) -> Self {
        compose("Parametric test still needs more arguments to cover execution at this point", withComment: comment)
    }
    /// Comment for tests and test cases where the system under test is incomplete.
    /// - Parameter context: Context of what is exactly incomplete.
    static func notImplemented(_ context: Any? = nil) -> Self {
        compose("System under test has not yet been implemented for this case", withComment: "\(context)")
    }
    /// Comment for tests and test cases where the implementation is currently untestable.
    /// 
    /// Can work for cancelling, disabling or failing tests.
    static func untestable(comment: Comment? = nil) -> Self {
        compose("System under test is not covered by unit tests", withComment: comment)
    }
}
#endif
