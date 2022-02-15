@testable import kindaVim
import KeyCombination
import XCTest


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
        XCTAssertEqual(asNormalModeMock.relevantParameter, "w")

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
        deleteSlashItself()
        
        // TODO: this is no gonna be true anymore
        // as explained above, w because there's is no AS return
        XCTAssertEqual(asNormalModeMock.functionCalled, "w(times:on:)")
        XCTAssertEqual(asNormalModeMock.relevantParameter, "")

    }
    
    // TODO: change also?
    // because no AS return. the KS one is doing like a dropdown select
    func test_that_for_deleteSlashItself_it_switches_Vim_into_InsertMode() {
        deleteSlashItself()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_for_deleteSlashItself_it_resets_the_count() {
        deleteSlashItself()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
