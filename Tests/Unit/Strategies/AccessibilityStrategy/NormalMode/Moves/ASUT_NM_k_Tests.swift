@testable import kindaVim
import KeyCombination
import XCTest


// check j for blah blah
class ASNM_k_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.k(on: element) 
    }
    
}


extension ASNM_k_Tests {
    
    func test_that_for_TextFields_k_returns_nil_coz_we_want_the_KS_to_take_over() {
        let text = "k on a TextField shouldn't use the AS! think Alfred"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 51,
            caretLocation: 36,
            selectedLength: 1,
            selectedText: "S",
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
