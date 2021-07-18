@testable import kindaVim
import XCTest


// x is one of those moves that needs to move the caret location AFTER
// it did something with the selectedText (like O). so here we can only test the cases
// where we don't call the ATEAdaptor. calling the ATEAdaptor only happens
// when the caret location is at the end of a line. that special case is tested
// in AS UI Tests
class ASNM_x_Tests: ASNM_BaseTests {
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asNormalMode.x(on: element) 
    }
    
}


// Both
extension ASNM_x_Tests {
    
    func test_that_in_normal_setting_it_deletes_the_character_after_the_caret_location() {
        let text = "x should delete the right character"
        
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 35,
            caretLocation: 11,
            selectedLength: 1,
            selectedText: "l",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 35
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 11)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertEqual(returnedElement?.selectedText, "")
    }
    
}
