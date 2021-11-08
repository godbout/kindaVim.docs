@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSVM_h_Tests: EnforcingKSVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        kindaVimEngine.handle(
            keyCombination: KeyCombination(key: .h),
            enforceKeyboardStrategy: true
        )
    }

}


// VisualStyle Characterwise
extension EnforcingKSVM_h_Tests {

    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "hForVisualStyleCharacterwise()")
    }

}


// VisualStyle Linewise
extension EnforcingKSVM_h_Tests {

    func test_that_it_does_not_call_any_function_on_KS_because_this_move_does_not_exist_for_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "")
    }

}


// Both
extension EnforcingKSVM_h_Tests {
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
}
