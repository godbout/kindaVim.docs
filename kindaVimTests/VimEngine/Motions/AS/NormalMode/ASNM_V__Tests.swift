@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_V__Tests: ASNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .V))
    }
    
}


extension SucceedingASNM_V__Tests {
    
    func test_that_it_calls_the_correct_function_on_AS() {
        applyKeyCombinationsBeingTested()
 
        XCTAssertEqual(asVisualModeMock.functionCalled, "VFromNormalMode(on:)")
    }
    
    func test_that_it_switches_Vim_to_VisualMode() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
    func test_that_it_sets_the_VisualStyle_to_Linewise() {
        kindaVimEngine.state.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.state.visualStyle, .linewise)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }
   
}
