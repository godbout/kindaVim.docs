@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSVM_c_Tests: EnforcingKSVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        kindaVimEngine.handle(
            keyCombination: KeyCombination(key: .c),
            enforceKeyboardStrategy: true
        )
    }

}


// VisualStyle Characterwise
extension EnforcingKSVM_c_Tests {

    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "c()")
    }

}


// VisualStyle Linewise
extension EnforcingKSVM_c_Tests {

    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "c()")
    }

}


// Both
extension EnforcingKSVM_c_Tests {
    
    func test_that_it_switches_Vim_into_InsertMode() {
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
}
