@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_v_Tests: FailingASVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .v))
    }
        
}


// Entering from Normal Mode
extension FailingASVM_v_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_Normal_Mode() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForTextElementWhenEnteringFromNormalMode()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_for_NonTextElements_as_a_fallback_when_in_Normal_Mode() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        kindaVimEngine.enterNormalMode()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForNonTextElement()")
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
extension FailingASVM_v_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_VisualStyle_Characterwise() {        
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForTextElementWhenInVisualStyleCharacterwise()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_for_NonTextElements_as_a_fallback_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForNonTextElement()")
    }
    
    func test_that_if_Vim_was_VisualStyle_Characterwise_it_switches_into_normal_mode() {
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
extension FailingASVM_v_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_VisualStyle_Linewise() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForTextElementWhenInVisualStyleLinewise()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Linewise() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vForNonTextElement()")
    }

    func test_that_if_Vim_was_in_VisualStyle_Linewise_it_switches_into_visual_mode_characterwise() {
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
