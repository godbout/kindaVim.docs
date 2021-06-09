@testable import kindaVim
import XCTest


class nextLineTests: TextEngineBaseTests {}


// TextViews
extension nextLineTests {
    
    func test_that_in_normal_setting_it_can_return_the_next_line() {
        let text = """
this is the first line
and now is the second
"""        
        let nextLine = textEngine.nextLine(after: 10, in: text)
        
        XCTAssertEqual(nextLine, "and now is the second")        
    }
    
    func test_that_if_on_the_last_line_then_it_returns_nil() {
        let text = """
we gonna put the caret
on the first line now
"""
        let nextLine = textEngine.nextLine(after: 30, in: text)
        
        XCTAssertNil(nextLine)         
    }
    
    func test_that_if_on_the_first_line_it_returns_the_next_line() {
        let text = """
we gonna put the caret
on the first line now
now that's the last line
"""
        let nextLine = textEngine.nextLine(after: 12, in: text)
        
        XCTAssertEqual(nextLine, "on the first line now\n")  
    }
    
    func test_that_if_the_caret_is_at_the_end_of_the_text_it_returns_nil() {
        let text = """
caret
at the end
of the text
"""
        let nextLine = textEngine.nextLine(after: 28, in: text)
        
        XCTAssertNil(nextLine) 
    }
    
    func test_that_if_the_caret_is_right_after_a_linefeed_it_still_gets_the_next_line() {
        let text = """
now the
caret will be
on a linefeed
"""
        let nextLine = textEngine.nextLine(after: 8, in: text)
        
        XCTAssertEqual(nextLine, "on a linefeed") 
        
    }
    
    func test_that_if_the_caret_is_right_before_a_linefeed_it_still_gets_the_next_line() {
        let text = """
now the
caret will be
on a linefeed
"""
        let nextLine = textEngine.nextLine(after: 7, in: text)
        
        XCTAssertEqual(nextLine, "caret will be\n")         
    }
    
}
