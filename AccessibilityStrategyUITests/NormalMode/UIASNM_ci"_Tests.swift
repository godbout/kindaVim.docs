@testable import kindaVim
import XCTest


// here we're just running a few UI Tests to complete the AccessibilityStrategy Unit Tests
// and also to be able to test whether ci" returns in insert mode when successful, or in 
// normal mode when it cannot apply the change. this need to be done here because the way
// to test whether it needs to get back to insert mode or stay in normal mode requires the
// AXUIElement. if it can't get the AXUIElement, for sure it would stay in normal mode
class UIASNM_ciDoubleQuote_Tests: UIAS_BaseTests {
    
    private func applyMoveAndGetBackUpdatedElement() -> AccessibilityTextElement? {
        return applyMoveAndGetBackUpdatedElement { focusedElement in 
            asNormalMode.ciDoubleQuote(on: focusedElement)
        }
    }
    
}


// Both
extension UIASNM_ciDoubleQuote_Tests {
    
    func test_that_in_normal_setting_it_can_delete_the_content_between_double_quotes() {
        let textInAXFocusedElement = """
hehe there's gonna be some "double quotes" in that shit
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        
        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, "hehe there's gonna be some \"\" in that shit")
    }
    
    func test_that_in_normal_setting_it_succeeds_and_switches_to_insert_mode() {
        let textInAXFocusedElement = """
hehe there's gonna be some "double quotes" in that shit
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
                        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .singleQuote, shift: true))
        
        XCTAssertEqual(VimEngine.shared.currentMode, .insert)        
    }
    
    func test_a_case_where_it_should_not_delete_the_content() {
        
        let textInAXFocusedElement = """
huhu only one " in there...
"""                
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)                
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        
        let originalElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement, originalElement)
    }
    
    func test_a_case_where_it_should_not_delete_the_content_stays_in_normal_mode() {
        let textInAXFocusedElement = """
huhu only one " in there...
"""                
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)                
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
                        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .singleQuote, shift: true))
        
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)      
    }
    
}
