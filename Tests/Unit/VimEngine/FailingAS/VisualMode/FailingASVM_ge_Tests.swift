@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_ge_Tests: FailingASVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .g))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .e))
    }

}


// VisualStyle Characterwise
extension FailingASVM_ge_Tests {
    
    func test_that_it_does_not_call_any_KS_function_because_this_move_is_not_doable_with_KS() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "")
    }
    
}


// VisualStyle Linewise
extension FailingASVM_ge_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_does_not_exist_for_VisualStyle_Linewise() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyKeyCombinationBeingTested()

        XCTAssertEqual(ksVisualModeMock.functionCalled, "")
    }
    
}


// Both
extension FailingASVM_ge_Tests {
    
    func test_athat_it_keeps_Vim_in_visual_mode() {
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
    }
        
}
