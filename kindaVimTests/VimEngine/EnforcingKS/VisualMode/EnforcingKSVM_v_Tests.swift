@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSVM_v_Tests: EnforcingKSVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .v), enforceKeyboardStrategy: true)
    }
    
}


// Entering from Normal Mode
extension EnforcingKSVM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_entering_from_NormalMode() {
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForEnteringFromNormalMode()")
    }
    
    func test_that_if_Vim_was_in_NormalMode_it_switches_into_VisualMode_Characterwise() {
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.visualStyle, .characterwise)
    }
    
}


// VisualStyle Characterwise
extension EnforcingKSVM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForVisualStyleCharacterwise()")
    }
    
    func test_that_if_Vim_was_in_VisualStyle_Characterwise_it_switches_into_NormalMode() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
}


// VisualStyle Linewise
extension EnforcingKSVM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForVisualStyleLinewise()")
    }
    
    func test_that_if_Vim_was_in_VisualStyle_Linewise_it_switches_into_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.visualStyle, .characterwise)
    }

}
