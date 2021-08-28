@testable import kindaVim
import KeyCombination
import XCTest


// only testing for when KS takes over here, rest is in UI Tests
class ASNM_j_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.j(on: element) 
    }
    
}


extension ASNM_j_Tests {
    
    func test_that_for_TextFields_j_returns_nil_coz_we_want_the_KS_to_take_over() {
        let text = "j on a TextField shouldn't use the AS! think Alfred"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 51,
            caretLocation: 23,
            selectedLength: 1,
            selectedText: "n",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 51
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertNil(returnedElement)
    }
    
}
