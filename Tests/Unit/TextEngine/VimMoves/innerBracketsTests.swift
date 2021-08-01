@testable import kindaVim
import XCTest


// this is using nextUnmatched and previousUnmatched internally, which are already tested on their own
// so here we have just a few cases for extra care, and got the special cases for this move as usual
class innerBracketsTests: TextEngineBaseTests {}


// TextFields
extension innerBracketsTests {

    func test_that_if_there_is_no_bracket_then_it_returns_nil() {
        let text = "how dumb can you be LOL"
        
        XCTAssertNil(
            textEngine.innerBrackets(using: "(", startingAt: 2, in: text)
        )
    }
    
    func test_that_if_there_is_only_one_bracket_then_it_returns_nil_also() {
        let text = "hey ho there's only one { in there!"
        
        XCTAssertNil(
            textEngine.innerBrackets(using: "{", startingAt: 15, in: text)
        )
    }
    
    func test_that_if_there_are_two_matched_brackets_and_the_caret_is_before_them_then_it_returns_nil() {
        let text = "still no gourmet [ shit for that ] one"
        
        XCTAssertNil(
            textEngine.innerBrackets(using: "[", startingAt: 3, in: text)
        )
    }
    
    func test_that_if_there_are_two_matched_brackets_and_the_caret_is_after_them_then_it_returns_nil() {
        let text = "again no { gourmet shit } ducking hell"
        
        XCTAssertNil(
            textEngine.innerBrackets(using: "{", startingAt: 33, in: text)
        )
    }
    
    func test_that_if_there_are_two_matched_brackets_and_the_caret_is_between_them_then_it_can_find_the_text() {
        let text = "ahhhhhh finally the { gourmet shit } motherfuckers"
        
        guard let innerBracketsRange = textEngine.innerBrackets(using: "{", startingAt: 24, in: text) else { return XCTFail() }
        
        XCTAssertEqual(innerBracketsRange.lowerBound, 20)
        XCTAssertEqual(innerBracketsRange.upperBound, 35)
    }
    
    func test_extra_cautiously_that_it_matches_the_right_pair_when_there_are_more_than_two_brackets() {
        let text = "hmm ok so we ( gonna try again ( some more and ) see i ) guess"
        
        guard let innerBracketsRange = textEngine.innerBrackets(using: "(", startingAt: 51, in: text) else { return XCTFail() }
        
        XCTAssertEqual(innerBracketsRange.lowerBound, 13)
        XCTAssertEqual(innerBracketsRange.upperBound, 55)
    }
   
}


// TextViews
extension innerBracketsTests {

    func test_that_it_works_when_the_brackets_are_not_on_the_same_line() {
        let text = """
var array = [
    😂️,
    💩️,
    🐶️
]
"""
        
        guard let innerBracketsRange = textEngine.innerBrackets(using: "[", startingAt: 27, in: text) else { return XCTFail() }
        
        XCTAssertEqual(innerBracketsRange.lowerBound, 12)
        XCTAssertEqual(innerBracketsRange.upperBound, 40)
    }
    
    // currently we don't skip brackets within quoted strings, but later we might have too.
    // Vim itself ignores them.
    // so currently this test "passes", but ultimately it doesn't behave like Vim.
    func test_that_currently_we_do_not_skip_brackets_that_are_within_quoted_strings() {
        let text = """
func something() [
        var 😂️ = ""
        var 🤣️ = "}"
}
"""
        
        guard let innerBracketsRange = textEngine.innerBrackets(using: "{", startingAt: 48, in: text) else { return XCTFail() }
        
        XCTAssertEqual(innerBracketsRange.lowerBound, 17)
        XCTAssertEqual(innerBracketsRange.upperBound, 59)
    }
    
}
