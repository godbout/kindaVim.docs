@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_G__Tests: EnforcingKSNM_BaseTests {

    private func applyMoveBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .G), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_G__Tests {
    
    func test_that_the_move_calls_the_correct_function_for_TextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        applyMoveBeingTested()
       
        XCTAssertEqual(ksNormalModeMock.functionCalled, "GForTextElement()")
    }
    
    func test_that_the_move_calls_the_correct_function_for_NonTextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        applyMoveBeingTested()
       
        XCTAssertEqual(ksNormalModeMock.functionCalled, "GForNonTextElement()")
    }
    
    func test_that_G__keeps_Vim_in_normal_mode() {
        applyMoveBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
}

