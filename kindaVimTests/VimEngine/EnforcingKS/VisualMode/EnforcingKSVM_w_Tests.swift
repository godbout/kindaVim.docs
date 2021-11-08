@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSVM_w_Tests: EnforcingKSVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        kindaVimEngine.handle(
            keyCombination: KeyCombination(key: .w),
            enforceKeyboardStrategy: true
        )
    }

}


// VisualStyle Characterwise
extension EnforcingKSVM_w_Tests {

    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "wForVisualStyleCharacterwise()")
    }

}


// VisualStyle Linewise
extension EnforcingKSVM_w_Tests {

    func test_that_it_does_not_call_any_function_on_KS_because_this_move_does_not_exist_for_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "")
    }

}


// Both
extension EnforcingKSVM_w_Tests {
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
}
