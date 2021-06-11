@testable import kindaVim
import XCTest


class lastLineTests: TextEngineBaseTests {}


// Both
extension lastLineTests {
    
    func test_that_if_the_text_is_only_one_line_it_returns_the_only_line_LOL() {
        let text = "hehe i'm single without a linefeed"
        
        let lastLine = textEngine.lastLine(in: text)
        
        XCTAssertEqual(lastLine.start, 0)
        XCTAssertEqual(lastLine.end, text.count)
        XCTAssertEqual(lastLine.value, text)  
    }
    
    func test_that_if_the_text_is_an_empty_line_it_returns_an_empty_string() {
        let text = ""
        
        let lastLine = textEngine.lastLine(in: text)
        
        XCTAssertEqual(lastLine.start, 0)
        XCTAssertEqual(lastLine.end, 0)
        XCTAssertEqual(lastLine.value, "")  
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
        
        XCTAssertEqual(lastLine.start, 21)
        XCTAssertEqual(lastLine.end, 26)
        XCTAssertEqual(lastLine.value, "line?")  
    }
    
    func test_that_if_the_last_line_is_empty_it_returns_the_correct_line() {
        let text = """
last line is
empty

"""
        let lastLine = textEngine.lastLine(in: text)
        
        XCTAssertEqual(lastLine.start, 19)
        XCTAssertEqual(lastLine.end, 19)
        XCTAssertEqual(lastLine.value, "")  
    }
    
    func test_that_if_the_last_line_only_contains_spaces_it_returns_the_correct_line() {
        let text = """
last line
looks empty but is actually
full of spaces
            
"""
        let lastLine = textEngine.lastLine(in: text)
        
        XCTAssertEqual(lastLine.start, 53)
        XCTAssertEqual(lastLine.end, 65)
        XCTAssertEqual(lastLine.value, "            ") 
    }
    
}
