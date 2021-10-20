@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_V__Tests: FailingASVM_BaseTests {
    
    private func applyKeyCombinationBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
    }
        
}


// Entering from Normal Mode
extension FailingASVM_V__Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_Normal_Mode() {
        KindaVimEngine.shared.enterNormalMode()
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForEnteringFromNormalMode()")
    }
    
    func test_that_if_Vim_was_in_NormalMode_it_switches_into_VisualMode_Linewise() {
        KindaVimEngine.shared.enterNormalMode()
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
        XCTAssertEqual(KindaVimEngine.shared.visualStyle, .linewise)
    }
    
}


// VisualStyle Characterwise
extension FailingASVM_V__Tests {

    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Characterwise() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForVisualStyleCharacterwise()")
    }
    
    func test_that_if_Vim_was_VisualStyle_Characterwise_it_switches_into_VisualMode_Linewise() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
        XCTAssertEqual(KindaVimEngine.shared.visualStyle, .linewise)
    }
       
}


// VisualStyle Linewise
extension FailingASVM_V__Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Linewise() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForVisualStyleLinewise()")
    }

    func test_that_if_Vim_was_in_VisualStyle_Linewise_it_switches_into_NormalMode() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyKeyCombinationBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}
