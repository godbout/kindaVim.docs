@testable import kindaVim
import KeyCombination
import XCTest


class ASVML_c_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.visualStyle = .linewise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.c(on: element) 
    }
    
}


// Both
extension ASVML_c_Tests {
    
    func test_that_in_normal_setting_it_deletes_the_selected_lines_but_without_the_last_linefeed_of_the_selection_if_any() {
        let text = """
VM c in Linewise
will delete the selected lines
but the below line will not go up
at least if we're not at the end of the text
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 126,
            caretLocation: 17,
            selectedLength: 65,
            selectedText: """
will delete the selected lines
but the below line will not go up

""",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 17,
                end: 48
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 17)
        XCTAssertEqual(returnedElement?.selectedLength, 64)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}


