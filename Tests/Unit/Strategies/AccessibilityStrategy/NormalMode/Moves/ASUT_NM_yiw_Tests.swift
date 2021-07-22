@testable import kindaVim
import XCTest


// so. this move uses a TE func that is already tested.
// also ciw is already extra testing, so here we gonna only test
// stuff specific to that move, which is the copying through NSPasteboard
class ASUT_NM_yiw_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.yiw(on: element) 
    }
    
}


// Both
extension ASUT_NM_yiw_Tests {
    
    func test_that_it_copies_the_inner_word() {
        let text = "some text without any double quote"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 34,
            caretLocation: 13,
            selectedLength: 1,
            selectedText: "h",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 34
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "without")
        XCTAssertEqual(returnedElement?.caretLocation, 10)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// emojis
extension ASUT_NM_yiw_Tests {
    
    func test_that_it_handles_emojis() {
        let text = """
need to deal with
th📍️se💨️💨️💨️ faces 🥺️☹️😂️ h😀️ha
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 56,
            caretLocation: 28,
            selectedLength: 3,
            selectedText: "💨️",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 18,
                end: 56
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "💨️💨️💨️")
        XCTAssertEqual(returnedElement?.caretLocation, 25)
        XCTAssertEqual(returnedElement?.selectedLength, 3)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
