@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_v_Tests: FailingASVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .v))
    }
        
}


// Entering from Normal Mode
extension FailingASVM_v_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_Normal_Mode() {
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
extension FailingASVM_v_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForVisualStyleCharacterwise()")
    }
    
    func test_that_if_Vim_was_VisualStyle_Characterwise_it_switches_into_normal_mode() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
}


// VisualStyle Linewise
extension FailingASVM_v_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForVisualStyleLinewise()")
    }

    func test_that_if_Vim_was_in_VisualStyle_Linewise_it_switches_into_visual_mode_characterwise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.visualStyle, .characterwise)
    }
        
}