//
//  Comment+Tests.swift
//  Evaluation
//
//  Created by Martônio Júnior on 09/09/2026.
//

@testable import Evaluation
import Testing

struct CommentTests {
    @Test("Defines common comment messages", arguments: [
        (Comment.flaky, Comment(rawValue: "The current implementation is flaky and may require changes in the future."))
    ])
    func constants(_ sut: Comment, expected: Comment) {
        #expect(sut == expected)
    }

    @Test("Asks for more arguments in parametric tests", arguments: [
        (Comment(rawValue: "YES!"), Comment(rawValue: "Parametric test still needs more arguments to cover execution at this point: YES!")),
        (Optional<Comment>.none, Comment(rawValue: "Parametric test still needs more arguments to cover execution at this point."))
    ])
    func needsMoreArguments(comment: Comment?, expected: Comment) {
        let result = Comment.needsMoreArguments(comment: comment)
        #expect(result == expected)
    }

    @Test("Informs that the system isn't implemented yet", arguments: [
        ("YES!", Comment(rawValue: "System under test has not yet been implemented for this case: YES!")),
        (Optional<String>.none, Comment(rawValue: "System under test has not yet been implemented for this case."))
    ])
    func notImplemented(context: String?, expected: Comment) {
        let result = Comment.notImplemented(context)
        #expect(result == expected)
    }

    @Test("Informs that something is untestable", arguments: [
        (Comment(rawValue: "YES!"), Comment(rawValue: "System under test is not covered by unit tests: YES!")),
        (Optional<Comment>.none, Comment(rawValue: "System under test is not covered by unit tests."))
    ])
    func untestable(comment: Comment?, expected: Comment) {
        let result = Comment.untestable(comment: comment)
        #expect(result == expected)
    }
}
