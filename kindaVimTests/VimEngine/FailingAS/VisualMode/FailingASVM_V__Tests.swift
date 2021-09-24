@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_V_Tests: FailingASVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
    }
        
}


// VisualStyle Characterwise
extension FailingASVM_V_Tests {
    
    func test_that_if_Vim_was_in_VisualStyle_Characterwise_it_switches_into_visual_mode_linewise() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
        XCTAssertEqual(KindaVimEngine.shared.visualStyle, .linewise)
    }
       
}


// VisualStyle Linewise
extension FailingASVM_V_Tests {
    
    func test_that_if_Vim_was_in_VisualStyle_Linewise_it_switches_into_normal_mode() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}


// Both
extension FailingASVM_V_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_there_is_no_need_to_call_a_KS_function_for_that_move() {
        applyKeyCombinationBeingTested()
            
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
}
