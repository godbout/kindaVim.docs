@testable import kindaVim
import KeyCombination
import XCTest


// TODO: now we have KS VM v and V. update accordingly.
class FailingASVM_v_Tests: FailingASVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
    }
        
}


// VisualStyle Characterwise
extension FailingASVM_v_Tests {
    
    func test_that_if_Vim_was_VisualStyle_Characterwise_it_switches_into_normal_mode() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
        
}


// VisualStyle Linewise
extension FailingASVM_v_Tests {
    
    func test_that_if_Vim_was_in_VisualStyle_Linewise_it_switches_into_visual_mode_characterwise() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
        XCTAssertEqual(KindaVimEngine.shared.visualStyle, .characterwise)
    }
        
}


// Both
extension FailingASVM_v_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_there_is_no_need_to_call_a_KS_function_for_that_move() {
        applyKeyCombinationBeingTested()
            
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
}
