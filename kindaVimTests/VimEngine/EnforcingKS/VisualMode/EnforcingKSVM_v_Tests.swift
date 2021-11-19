@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSVM_v_Tests: EnforcingKSVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .v), enforceKeyboardStrategy: true)
    }
    
}


// Entering from Normal Mode
extension EnforcingKSVM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_entering_from_NormalMode() {
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForEnteringFromNormalMode()")
    }
    
    func test_that_if_Vim_was_in_NormalMode_it_switches_into_VisualMode_Characterwise() {
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.visualStyle, .characterwise)
    }
    
    func test_that_it_resets_the_count_when_entering_from_NormalMode() {
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}


// VisualStyle Characterwise
extension EnforcingKSVM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForVisualStyleCharacterwise()")
    }
    
    func test_that_if_Vim_was_in_VisualStyle_Characterwise_it_switches_into_NormalMode() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count_if_Vim_was_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
        
}


// VisualStyle Linewise
extension EnforcingKSVM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForVisualStyleLinewise()")
    }
    
    func test_that_if_Vim_was_in_VisualStyle_Linewise_it_switches_into_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.visualStyle, .characterwise)
    }
    
    func test_that_it_resets_the_count_if_Vim_was_in_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
