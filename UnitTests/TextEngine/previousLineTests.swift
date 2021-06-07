@testable import kindaVim
import XCTest


class previousLineTests: TextEngineBaseTests {}


// TextViews
extension previousLineTests {
    
    func test_that_in_normal_setting_it_can_return_the_previous_line() {
        let text = """
this is the first line
and now is the second
"""        
        let previousLine = textEngine.previousLine(before: 35, in: text)
        
        XCTAssertEqual(previousLine, "this is the first line\n")        
    }
    
    func test_that_if_on_the_first_line_then_it_returns_nil() {
        let text = """
we gonna put the caret
on the first line now
"""
        let previousLine = textEngine.previousLine(before: 15, in: text)
        
        XCTAssertNil(previousLine)         
    }
    
    func test_that_if_on_the_last_line_it_returns_the_previous_line() {
        let text = """
we gonna put the caret
on the first line now
now that's the last line
"""
        let previousLine = textEngine.previousLine(before: 63, in: text)
        
        XCTAssertEqual(previousLine, "on the first line now\n")  
    }
    
    func test_that_if_the_caret_is_at_the_end_of_the_text_it_returns_the_previous_line() {
        let text = """
caret
at the end
of the text
"""
        let previousLine = textEngine.previousLine(before: 28, in: text)
        
        XCTAssertEqual(previousLine, "at the end\n") 
    }
    
    func test_that_if_the_caret_is_right_after_a_linefeed_it_still_gets_the_previous_line() {
        let text = """
now the
caret will be
on a linefeed
"""
        let previousLine = textEngine.previousLine(before: 22, in: text)
        
        XCTAssertEqual(previousLine, "caret will be\n") 
        
    }
    
    func test_that_if_the_caret_is_right_before_a_linefeed_it_still_gets_the_previous_line() {
        let text = """
now the
caret will be
on a linefeed
"""
        let previousLine = textEngine.previousLine(before: 21, in: text)
        
        XCTAssertEqual(previousLine, "now the\n")         
    }
    
}
