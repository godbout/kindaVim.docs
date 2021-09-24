@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSVM_V__Tests: EnforcingKSVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V), enforceKeyboardStrategy: true)
    }
    
}


// VisualStyle Characterwise
extension EnforcingKSVM_V__Tests {
    
    func test_that_if_Vim_was_in_VisualStyle_Characterwise_it_switches_into_VisualStyle_Linewise() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
        XCTAssertEqual(KindaVimEngine.shared.visualStyle, .linewise)
    }
        
}


// VisualStyle Linewise
extension EnforcingKSVM_V__Tests {
    
    func test_that_if_Vim_was_in_VisualStyle_Linewise_it_switches_into_NormalMode() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
   
}


// Both
extension EnforcingKSVM_V__Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_there_is_no_need_to_call_a_KS_function_for_that_move() {
        applyKeyCombinationBeingTested()
       
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
   
}
