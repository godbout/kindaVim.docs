@testable import kindaVim
import KeyCombination
import XCTest
import Common


class SucceedingASNM_f_Tests: ASNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .f))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
    }
    
}


extension SucceedingASNM_f_Tests {
    
    func test_that_it_sets_lastLeftRightSearch_correctly() {
        XCTAssertNil(kindaVimEngine.lastLeftRightSearch)
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastLeftRightSearch, LastLeftRightSearch(motion: .f, character: "i"))
    }
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(asNormalModeMock.functionCalled, "f(times:to:on:)")
        XCTAssertEqual(asNormalModeMock.relevantParameter, "i")
    }
    
    func test_that_it_keeps_Vim_in_NormalMode() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }

}
