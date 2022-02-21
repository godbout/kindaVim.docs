@testable import kindaVim
import KeyCombination
import XCTest


// this is testing deleting characters while we're typing the searchString
class SucceedingASNM_interrogationMark_Delete_Tests: ASNM_BaseTests {
    
    private func deleteCharacterFromSearchString() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .interrogationMark))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .six))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .delete))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
    }
        
    private func deleteSlashItself() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .interrogationMark))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .delete))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
    }
    
}


// deleteCharacterFromSearchString
extension SucceedingASNM_interrogationMark_Delete_Tests {
    
    func test_that_for_deleteCharacterFromSearchString_it_calls_the_correct_function_on_accessibility_strategy() {
        deleteCharacterFromSearchString()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "interrogationMark(times:to:on:)")
    }
    
    func test_that_for_deleteCharacterFromSearchString_it_keeps_Vim_in_NormalMode() {
        deleteCharacterFromSearchString()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_for_deleteCharacterFromSearchString_it_resets_the_count() {
        deleteCharacterFromSearchString()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}


// deleteSlashItself
extension SucceedingASNM_interrogationMark_Delete_Tests {

    // here we use the TextArea mock rather than the default one (someOtherShit) because return
    // is only called on TextAreas. on TextFields and other shits it is sent to KS instead.
    func test_that_for_deleteSlashItself_it_calls_the_correct_function_on_accessibility_strategy() {
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingTextAreaMock()
        deleteSlashItself()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "return(times:on:_:)")
    }
    
    // here we use again the TextArea mock so that it does the normal AS return
    // which stays in Normal Mode. if the return is sent to KS it would depend. this is
    // tested in KS itself.
    func test_that_for_deleteSlashItself_it_switches_Vim_into_InsertMode() {
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingTextAreaMock()
        deleteSlashItself()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_for_deleteSlashItself_it_resets_the_count() {
        deleteSlashItself()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
