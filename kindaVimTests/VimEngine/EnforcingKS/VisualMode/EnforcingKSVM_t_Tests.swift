@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSVM_t_Tests: EnforcingKSVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .t), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .z), enforceKeyboardStrategy: true)
    }

}


// VisualStyle Characterwise
extension EnforcingKSVM_t_Tests {

    func test_that_it_does_not_call_any_KS_function_because_this_move_is_not_doable_with_KS() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "")
    }

}


// VisualStyle Linewise
extension EnforcingKSVM_t_Tests {

    func test_that_it_does_not_call_any_function_on_KS_because_this_move_does_not_exist_for_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "")
    }

}


// Both
extension EnforcingKSVM_t_Tests {
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
}
