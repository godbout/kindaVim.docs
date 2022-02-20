@testable import kindaVim
import KeyCombination
import XCTest
import Common


// this is testing deleting characters while we're typing the searchString
class SucceedingASNM_slash_Delete_Tests: ASNM_BaseTests {
    
    private func deleteCharacterFromSearchString() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .slash))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .six))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .delete))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
    }
        
    private func deleteSlashItself() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .slash))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .delete))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
    }
    
}


// deleteCharacterFromSearchString
extension SucceedingASNM_slash_Delete_Tests {
    
    func test_that_for_deleteCharacterFromSearchString_it_calls_the_correct_function_on_accessibility_strategy() {
        deleteCharacterFromSearchString()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "slash(times:to:on:)")
        XCTAssertEqual(asNormalModeMock.lastSearchCommandParameter, LastSearchCommand(motion: .slash, searchString: "w"))
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


// see ? for blah blah
// deleteSlashItself
extension SucceedingASNM_slash_Delete_Tests {
    
    func test_that_for_deleteSlashItself_it_calls_the_correct_function_on_accessibility_strategy() {
        // here we use the TextArea mock rather than the default one (someOtherShit) because return
        // is only called on TextAreas. on TextFields and other shits it is sent to KS instead.
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingTextAreaMock()
        deleteSlashItself()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "return(times:on:_:)")
        XCTAssertEqual(asNormalModeMock.relevantParameter, "")

    }
    
    
    func test_that_for_deleteSlashItself_it_stays_in_NormalMode() {
        // here we use again the TextArea mock so that it does the normal AS return
        // which stays in Normal Mode. if the return is sent to KS it would depend. this is
        // tested in KS itself.
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingTextAreaMock()
        deleteSlashItself()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_for_deleteSlashItself_it_resets_the_count() {
        deleteSlashItself()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
