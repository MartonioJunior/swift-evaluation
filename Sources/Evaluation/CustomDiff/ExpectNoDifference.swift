//
//  ExpectNoChanges.swift
//  Evaluation
//
//  Created by Martônio Júnior on 03/09/2026.
//

import CustomDump
import IssueReporting

/// Assert that a value does not change after applying a mutation to it.
/// - Parameters:
///   - expression: An expression of type T, where T is Equatable.
///   - updateExpectingResult: A closure that asserts how the expression changed by supplying a mutable version of the initial value. This value must be modified to match the final value.
///   - message: An optional description of a failure.
///   - fileID: The file where the failure occurs. The default is the file ID of the test case where you call this function.
///   - filePath: The file where the failure occurs. The default is the file path of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
///   - column: The column where the failure occurs. The default is the column where you call this function.
///
public func expectNoDifference<T: Equatable>(
    _ expression: @autoclosure () throws -> T,
    afterChanges updateExpectingResult: (inout T) throws -> Void,
    message: @autoclosure () -> String? = nil,
    fileID: StaticString = #fileID,
    filePath: StaticString = #filePath,
    line: UInt = #line,
    column: UInt = #column
) {
    do {
        let expression1 = try expression()
        var expression2 = expression1
        try updateExpectingResult(&expression2)
        expectNoDifference(
            expression1,
            expression2,
            message(),
            fileID: fileID, filePath: filePath, line: line, column: column
        )
    } catch {
        reportIssue(error, fileID: fileID, filePath: filePath, line: line, column: column)
    }
}
