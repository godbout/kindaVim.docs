@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_b_Tests: FailingASVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .b))
    }

}


// VisualStyle Characterwise
extension FailingASVM_b_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "bForVisualStyleCharacterwise()")
    }
    
}


// VisualStyle Linewise
extension FailingASVM_b_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_does_not_exist_for_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationBeingTested()

        XCTAssertEqual(ksVisualModeMock.functionCalled, "")
    }
    
}


// Both
extension FailingASVM_b_Tests {
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
        
}
