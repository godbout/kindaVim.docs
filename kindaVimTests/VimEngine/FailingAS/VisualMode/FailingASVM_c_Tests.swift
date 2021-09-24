@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_c_Tests: FailingASVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
    }

}


// VisualStyle Characterwise
extension FailingASVM_c_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_YET_implemented() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }

}


extension FailingASVM_c_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_ALSO_YET_implemented() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }

}


// Both
extension FailingASVM_c_Tests {
    
    func test_that_it_switches_Vim_into_InsertMode() {
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }
   
}
