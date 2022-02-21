@testable import kindaVim
import KeyCombination
import XCTest
import Common


// see ? for blah blah
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


// deleteSlashItself
extension SucceedingASNM_slash_Delete_Tests {
    
    // see ? for blah blah 
    func test_that_for_deleteSlashItself_it_calls_the_correct_function_on_accessibility_strategy() {
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingTextAreaMock()
        deleteSlashItself()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "return(times:on:_:)")
    }
    
    
    // see ? for blah blah
    func test_that_for_deleteSlashItself_it_stays_in_NormalMode() {
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingTextAreaMock()
        deleteSlashItself()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_for_deleteSlashItself_it_resets_the_count() {
        deleteSlashItself()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
