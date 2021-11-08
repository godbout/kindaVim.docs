@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_d_Tests: FailingASVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
    }
   
}


// VisualStyle Characterwise
extension FailingASVM_d_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "d()")
    }

}


// VisualStyle Linewise
extension FailingASVM_d_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "d()")
    }

}


// Both
extension FailingASVM_d_Tests {

    func test_that_it_switches_Vim_into_NormalMode() {
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
}

