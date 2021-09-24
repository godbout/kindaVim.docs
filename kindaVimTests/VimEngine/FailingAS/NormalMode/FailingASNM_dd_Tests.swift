@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_dd_Tests: FailingAS_BaseTests {
    
    private func applyMoveBeingTested() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d), enforceKeyboardStrategy: true)
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d), enforceKeyboardStrategy: true)
    }

}


extension FailingASNM_dd_Tests {
    
    func test_that_the_move_calls_the_correct_function_for_TextElements_on_KS() {
        KindaVimEngine.shared.axEngine = AXEngineTextElementMock()
        applyMoveBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "ddForTextElement()")
    }
    
    func test_that_the_move_calls_the_correct_function_for_NonTextElements_on_KS() {
        KindaVimEngine.shared.axEngine = AXEngineNonTextElementMock()
        applyMoveBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "ddForNonTextElement()")
    }
    
    func test_that_dd_keeps_Vim_in_normal_mode() {
        applyMoveBeingTested()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
   
}
