@testable import kindaVim
import KeyCombination
import XCTest


class ASUT_VMC_c_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.visualStyle = .characterwise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.c(on: element) 
    }
    
}


// Both
extension ASUT_VMC_c_Tests {
    
    func test_that_when_the_selection_is_spanning_on_a_single_line_it_deletes_the_selected_text() {
        let text = "ok so VM c (hahaha) on a single line"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 36,
            caretLocation: 14,
            selectedLength: 13,
            selectedText: "haha) on a si",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 36
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 14)
        XCTAssertEqual(returnedElement?.selectedLength, 13)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
    func test_that_when_the_selection_is_spanning_on_multiple_linse_it_deletes_the_selected_text() {
        let text = """
like same as above
but on multiple
lines because
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 48,
            caretLocation: 8,
            selectedLength: 36,
            selectedText: """
e as above
but on multiple
lines bec
""",
            currentLine: AccessibilityTextElementLine(
            fullValue: text,
                number: 1,
                start: 0,
                end: 19
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 8)
        XCTAssertEqual(returnedElement?.selectedLength, 36)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}


// emojis
// no need to test emojis here. this moves doesn't select according to
// character length
extension ASUT_VMC_c_Tests {}
