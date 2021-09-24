@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_y_Tests: FailingASVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
    }
    
}


// VisualStyle Characterwise
extension FailingASVM_y_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Characterwise() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "y()")
    }

}


// VisualStyle Linewise
extension FailingASVM_y_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Linewise() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "y()")
    }

}


// Both
extension FailingASVM_y_Tests {

    func test_that_it_switches_Vim_into_NormalMode() {
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
