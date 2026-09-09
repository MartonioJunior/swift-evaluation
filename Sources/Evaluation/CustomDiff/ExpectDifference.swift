//
//  ExpectDifference.swift
//  Evaluation
//
//  Created by Martônio Júnior on 08/09/2026.
//

import CustomDump

/// Expects that a value has a set of changes.
/// 
/// - Parameters:
///   - expression: An expression that is evaluated before and after `operation`, and then compared.
///   - message: An optional description of a failure.
///   - operation: An optional operation that is performed in between an initial and final
///     evaluation of `operation`. By omitting this operation, you can write a "non-exhaustive"
///     assertion against an already-changed value by describing just the fields you want to assert
///     against in the `changes` closure.
///   - updateExpectingResult: A closure that asserts how the expression changed by supplying a
///     mutable version of the initial value. This value must be modified to match the final value.
///   - fileID: The file where the failure occurs. The default is the file ID of the test case where you call this function.
///   - filePath: The file where the failure occurs. The default is the file path of the test case where you call this function.
///   - line: The line number where the failure occurs. The default is the line number where you call this function.
///   - column: The column where the failure occurs. The default is the column where you call this function.
public func expectDifference<T: Equatable, E: Error>(
    _ expression: @autoclosure () throws(E) -> T,
    _ message: @autoclosure () -> String? = nil,
    operation: @escaping (inout T) throws -> Void,
    changes updateExpectingResult: @escaping (inout T) throws -> Void,
    fileID: StaticString = #fileID,
    filePath: StaticString = #filePath,
    line: UInt = #line,
    column: UInt = #column
) throws(E) {
    var value = try expression()
    let expected = value
    expectDifference(
        expected,
        message(),
        operation: { try operation(&value) },
        changes: updateExpectingResult,
        fileID: fileID, filePath: filePath, line: line, column: column
    )
}
