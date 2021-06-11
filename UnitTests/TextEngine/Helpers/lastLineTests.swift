@testable import kindaVim
import XCTest


class lastLineTests: TextEngineBaseTests {}


// Both
extension lastLineTests {
    
    func test_that_if_the_text_is_only_one_line_it_returns_the_only_line_LOL() {
        let text = "hehe i'm single without a linefeed"
        
        let lastLine = textEngine.lastLine(in: text)
        
        XCTAssertEqual(lastLine, text)  
    }
    
    func test_that_if_the_text_is_an_empty_line_it_returns_an_empty_string() {
        let text = ""
        
        let lastLine = textEngine.lastLine(in: text)
        
        XCTAssertEqual(lastLine, "")
    }
    
}


// TextViews
extension lastLineTests {
    
    func test_that_it_does_return_the_last_line() {
        let text = """
can we find
the last
line?
"""
        let lastLine = textEngine.lastLine(in: text)
        
        XCTAssertEqual(lastLine, "line?")
    }
    
    func test_that_if_the_last_line_is_empty_it_returns_the_correct_line() {
        let text = """
last line is
empty

"""
        let lastLine = textEngine.lastLine(in: text)
        
        XCTAssertEqual(lastLine, "")
    }
    
    func test_that_if_the_last_line_only_contains_spaces_it_returns_the_correct_line() {
        let text = """
last line
looks empty but is actually
full of spaces
            
"""
        let lastLine = textEngine.lastLine(in: text)
        
        XCTAssertEqual(lastLine, "            ")
    }
    
}
