@testable import kindaVim
import XCTest


class firstLineTests: TextEngineBaseTests {}


// Both
extension firstLineTests {
    
    func test_that_if_the_text_is_only_one_line_it_returns_the_only_line_LOL() {
        let text = "well i'm a single line, without a linefeed"
        
        let firstLine = textEngine.firstLine(in: text)
        
        XCTAssertEqual(firstLine.value, text)  
    }
    
    func test_that_if_the_text_is_an_empty_line_it_returns_an_empty_string() {
        let text = ""
        
        let firstLine = textEngine.firstLine(in: text)
        
        XCTAssertEqual(firstLine.value, "")
    }
    
}


// TextViews
extension firstLineTests {
    
    func test_that_it_does_return_the_first_line() {
        let text = """
of course
some multiline
again
"""
        let firstLine = textEngine.firstLine(in: text)
        
        XCTAssertEqual(firstLine.value, "of course\n")
    }
    
    func test_that_if_the_first_line_is_empty_but_with_a_linefeed_it_returns_the_correct_line() {
        let text = """

first line
empty
"""
        let firstLine = textEngine.firstLine(in: text)
        
        XCTAssertEqual(firstLine.value, "\n")
    }
    
    func test_that_if_the_first_line_only_contains_spaces_it_returns_the_correct_line() {
        let text = """
       
now first line
has spaces
"""
        let firstLine = textEngine.firstLine(in: text)
        
        XCTAssertEqual(firstLine.value, "       \n")
    }
 
}
