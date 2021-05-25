@testable import kindaVim
import XCTest

class AS_j_Tests: AS_BaseTests {}

// TextFields
extension AS_j_Tests {
    
    func test_that_for_TextFields_j_returns_nil_coz_we_want_the_KS_to_take_over() {
        let text = "j on a TextField shouldn't use the AS! think Alfred"
        let element = AccessibilityTextElement(
            axValue: text,
            axCaretLocation: 4,
            axLineStart: 0,
            axLineEnd: text.count
        )
        
        let returnedElement = accessibilityStrategy.j(on: element)
        
        XCTAssertNil(returnedElement)
    }
    
}
