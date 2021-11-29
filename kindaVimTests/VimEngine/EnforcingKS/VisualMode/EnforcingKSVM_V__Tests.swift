@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSVM_V__Tests: EnforcingKSVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .V), appMode: .enforceKeyboardStrategy)
    }
    
}


// Entering from Normal Mode
extension EnforcingKSVM_V__Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_entering_from_NormalMode() {
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForEnteringFromNormalMode()")
    }
    
    func test_that_if_Vim_was_in_NormalMode_it_switches_into_VisualMode_Linewise() {
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.visualStyle, .linewise)
    }
    
    func test_that_it_resets_the_count_when_entering_from_NormalMode() {
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.count, 1)
    }
    
}


// VisualStyle Characterwise
extension EnforcingKSVM_V__Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForVisualStyleCharacterwise()")
    }
    
    func test_that_if_Vim_was_in_VisualStyle_Characterwise_it_switches_into_VisualMode_Linewise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.visualStyle, .linewise)
    }
    
    func test_that_it_resets_the_count_if_Vim_was_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.count, 1)
    }
    
}


// VisualStyle Linewise
extension EnforcingKSVM_V__Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForVisualStyleLinewise()")
    }
    
    func test_that_if_Vim_was_in_VisualStyle_Linewise_it_switches_into_NormalMode() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count_if_Vim_was_in_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
