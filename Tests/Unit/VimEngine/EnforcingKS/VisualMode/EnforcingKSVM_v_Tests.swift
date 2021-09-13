@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSVM_v_Tests: EnforcingKSVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v), enforceKeyboardStrategy: true)
    }
    
}


// VisualStyle Characterwise
extension EnforcingKSVM_v_Tests {
    
    func test_that_if_Vim_was_in_VisualStyle_Characterwise_it_switches_into_NormalMode() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
        
}


// VisualStyle Linewise
extension EnforcingKSVM_v_Tests {
    
    func test_that_if_Vim_was_in_VisualStyle_Linewise_it_switches_into_VisualStyle_Characterwise() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
        XCTAssertEqual(KindaVimEngine.shared.visualStyle, .characterwise)
    }

}


// Both
extension EnforcingKSVM_v_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_there_is_no_need_to_call_a_KS_function_for_that_move() {
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
   
}
