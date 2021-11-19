@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_gI_Tests: FailingASVM_BaseTests {
    
    private func applyMoveBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .I))
    }
    
}


// VisualStyle Characterwise
extension FailingASVM_gI_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback() {
        kindaVimEngine.visualStyle = .characterwise
        applyMoveBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "gIForVisualStyleCharacterwise()")
    }

}


// VisualStyle Linewise
extension FailingASVM_gI_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_does_not_exist_for_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyMoveBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "")
    }

}


// Both
extension FailingASVM_gI_Tests {
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        applyMoveBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
}
