@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_ge_Tests: FailingASVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .e))
    }

}


// VisualStyle Characterwise
extension FailingASVM_ge_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "geForVisualStyleCharacterwise()")
    }
    
}


// VisualStyle Linewise
extension FailingASVM_ge_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_does_not_exist_for_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(ksVisualModeMock.functionCalled, "")
    }
    
}


// Both
extension FailingASVM_ge_Tests {
    
    func test_athat_it_keeps_Vim_in_visual_mode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
        
}
