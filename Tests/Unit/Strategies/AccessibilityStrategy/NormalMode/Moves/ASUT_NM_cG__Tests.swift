@testable import kindaVim
import XCTest


class ASUT_NM_cG__Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.cG(on: element) 
    }
    
}


// Both
extension ASUT_NM_cG__Tests {
    
    func test_that_it_deletes_the_whole_line() {
        let text = "this is a single line ‼️‼️‼️"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 28,
            caretLocation: 15,
            selectedLength: 1,
            selectedText: "e",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 28
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 0)
        XCTAssertEqual(returnedElement?.selectedLength, 28)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}


// TextViews
extension ASUT_NM_cG__Tests {
    
    func test_that_it_deletes_from_the_beginning_of_the_current_line_to_the_end_of_the_TextView() {
        let text = """
blah blah some line
some more
haha geh
need to deal with
those faces 🥺️☹️😂️

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 78,
            caretLocation: 35,
            selectedLength: 1,
            selectedText: "g",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 3,
                start: 30,
                end: 39
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 30)
        XCTAssertEqual(returnedElement?.selectedLength, 48)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}
