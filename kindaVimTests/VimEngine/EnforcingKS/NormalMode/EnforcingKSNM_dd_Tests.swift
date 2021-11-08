@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_dd_Tests: EnforcingKSNM_BaseTests {

    private func applyMoveBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_dd_Tests {
    
    func test_that_the_move_calls_the_correct_function_for_TextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        applyMoveBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "ddForTextElement()")
    }
    
    func test_that_the_move_calls_the_correct_function_for_NonTextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        applyMoveBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "ddForNonTextElement()")
    }
    
    func test_that_dd_keeps_Vim_in_normal_mode() {
        applyMoveBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
}
