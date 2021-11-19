@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_V__Tests: FailingASVM_BaseTests {
    
    private func applyMoveBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .V))
    }
        
}


// Entering from Normal Mode
extension FailingASVM_V__Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_Normal_Mode() {
        kindaVimEngine.enterNormalMode()
        applyMoveBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForEnteringFromNormalMode()")
    }
    
    func test_that_if_Vim_was_in_NormalMode_it_switches_into_VisualMode_Linewise() {
        kindaVimEngine.enterNormalMode()
        applyMoveBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.visualStyle, .linewise)
    }
    
}


// VisualStyle Characterwise
extension FailingASVM_V__Tests {

    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyMoveBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForVisualStyleCharacterwise()")
    }
    
    func test_that_if_Vim_was_VisualStyle_Characterwise_it_switches_into_VisualMode_Linewise() {
        kindaVimEngine.visualStyle = .characterwise
        applyMoveBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.visualStyle, .linewise)
    }
       
}


// VisualStyle Linewise
extension FailingASVM_V__Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback_when_in_VisualStyle_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyMoveBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VForVisualStyleLinewise()")
    }

    func test_that_if_Vim_was_in_VisualStyle_Linewise_it_switches_into_NormalMode() {
        kindaVimEngine.visualStyle = .linewise
        applyMoveBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}
