@testable import kindaVim
import KeyCombination
import XCTest


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


// deleteSlashItself
// currently there is no `return` move in AS. it's sent to KS, which does a return and goes to IM.
// this is to handle selecting stuff like dropdowns, for example in Alfred. maybe later we do an AS return
// for TextViews. then these tests below will fail and will have to be changed.
extension SucceedingASNM_interrogationMark_Delete_Tests {
    
    func test_that_for_deleteSlashItself_it_calls_the_correct_function_on_accessibility_strategy() {
        deleteSlashItself()
        
        // as explained above, w because there's is no AS return
        XCTAssertEqual(asNormalModeMock.functionCalled, "w(times:on:)")
        XCTAssertEqual(asNormalModeMock.relevantParameter, "")

    }
    
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
