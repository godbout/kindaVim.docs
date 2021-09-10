@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_G__Tests: FailingAS_BaseTests {
    
    private func applyMoveBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .G), enforceKeyboardStrategy: true)
    }

}


extension FailingASNM_G__Tests {
    
    func test_that_the_move_calls_the_correct_function_for_TextElements_on_KS() {
        KindaVimEngine.shared.axEngine = AXEngineTextElementMock()
        applyMoveBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "GForTextElement()")
    }
    
    func test_that_the_move_calls_the_correct_function_for_NonTextElements_on_KS() {
        KindaVimEngine.shared.axEngine = AXEngineNonTextElementMock()
        applyMoveBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "GForNonTextElement()")
    }
    
    func test_that_G__keeps_Vim_in_normal_mode() {
        applyMoveBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
   
}
