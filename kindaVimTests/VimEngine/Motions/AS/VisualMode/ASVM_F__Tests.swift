@testable import kindaVim
import KeyCombination
import XCTest
import Common


class SucceedingASVM_F__Tests: ASVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .F))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .O))
    }
    
}


extension SucceedingASVM_F__Tests {
    
    func test_that_it_sets_lastLeftRightSearch_correctly() {
        XCTAssertNil(kindaVimEngine.lastLeftRightSearch)
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastLeftRightSearch, LastLeftRightSearch(motion: .F, character: "O"))
    }
    
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(asVisualModeMock.functionCalled, "F(times:to:on:_:)")
        XCTAssertEqual(asVisualModeMock.relevantParameter, "O")
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
