@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_v_Tests: ASNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .v))
    }
    
}


extension SucceedingASNM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_AS() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "vFromNormalMode(on:)")
    }
        
    func test_that_it_switches_Vim_to_VisualMode() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
    func test_that_it_sets_the_VisualStyle_to_Characterwise() {
        kindaVimEngine.state.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.state.visualStyle, .characterwise)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
