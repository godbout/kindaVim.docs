@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSVM_v_Tests: EnforcingKSVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .v), enforceKeyboardStrategy: true)
    }
    
}


// Entering from Normal Mode
extension EnforcingKSVM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_entering_from_NormalMode() {
        KindaVimEngine.shared.enterNormalMode()
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForEnteringFromNormalMode()")
    }
    
    func test_that_if_Vim_was_in_NormalMode_it_switches_into_VisualMode_Characterwise() {
        KindaVimEngine.shared.enterNormalMode()
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
        XCTAssertEqual(KindaVimEngine.shared.visualStyle, .characterwise)
    }
    
}


// VisualStyle Characterwise
extension EnforcingKSVM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Characterwise() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForVisualStyleCharacterwise()")
    }
    
    func test_that_if_Vim_was_in_VisualStyle_Characterwise_it_switches_into_NormalMode() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
        
}


// VisualStyle Linewise
extension EnforcingKSVM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Linewise() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForVisualStyleLinewise()")
    }
    
    func test_that_if_Vim_was_in_VisualStyle_Linewise_it_switches_into_VisualStyle_Characterwise() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
        XCTAssertEqual(KindaVimEngine.shared.visualStyle, .characterwise)
    }

}
