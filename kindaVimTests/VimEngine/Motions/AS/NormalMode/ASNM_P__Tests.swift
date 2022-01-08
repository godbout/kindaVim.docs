@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_P__Tests: ASNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .P))
    }
        
}


// lastYankStyle characterwise
extension SucceedingASNM_P__Tests {
    
    // TODO: i think we gonna remove that later right? passing the style in &state
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy_when_LastYankStyle_is_Characterwise() {
        kindaVimEngine.state.lastYankStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "PForLastYankStyleCharacterwise(on:_:)")
    }
    
}


// lastYankStyle linewise
extension SucceedingASNM_P__Tests {
    
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy_when_LastYankStyle_is_Linewise() {
        kindaVimEngine.state.lastYankStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "PForLastYankStyleLinewise(on:_:)")
    }
    
}


// both
extension SucceedingASNM_P__Tests {
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.state.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
