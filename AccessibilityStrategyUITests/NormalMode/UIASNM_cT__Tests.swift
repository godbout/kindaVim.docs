@testable import kindaVim
import XCTest


class UIASNM_cT__Tests: UIAS_BaseTests {}


// Both
extension UIASNM_cT__Tests {
    
    func test_that_in_normal_setting_it_succeeds_and_switches_to_insert_mode() {
        let textInAXFocusedElement = """
cT is pretty cool
"""
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        VimEngine.shared.enterNormalMode()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .t, shift: true))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .p))
        
        XCTAssertEqual(VimEngine.shared.currentMode, .insert)        
    }
    
    func test_a_case_where_it_should_not_delete_the_content_stays_in_normal_mode() {
        let textInAXFocusedElement = """
hehe can't use cT here with the last letter of the alphabet!
"""                
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)                
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [.option])
        VimEngine.shared.enterNormalMode()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .t, shift: true))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .z))
        
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)      
    }
    
}
