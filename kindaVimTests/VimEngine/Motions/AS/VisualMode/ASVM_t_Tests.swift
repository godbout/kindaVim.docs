@testable import kindaVim
import KeyCombination
import XCTest
import Common


class SucceedingASVM_t_Tests: ASVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .t))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .z))
    }
    
}


extension SucceedingASVM_t_Tests {
    
    func test_that_it_sets_lastLeftRightSearch_correctly() {
        XCTAssertNil(kindaVimEngine.lastLeftRightSearch)
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastLeftRightSearch, LastLeftRightSearch(motion: .t, character: "z"))
    }
    
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(asVisualModeMock.functionCalled, "t(times:to:on:_:)")
        XCTAssertEqual(asVisualModeMock.relevantParameter, "z")
    }
    
    func test_that_it_keeps_Vim_in_VisualMode() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }     
        
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
