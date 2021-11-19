@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_gg_Tests: EnforcingKSNM_BaseTests {

    private func applyMoveBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_gg_Tests {
    
    func test_that_the_move_calls_the_correct_function_for_TextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        applyMoveBeingTested()
       
        XCTAssertEqual(ksNormalModeMock.functionCalled, "ggForTextElement()")
    }
    
    func test_that_the_move_calls_the_correct_function_for_NonTextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        applyMoveBeingTested()
       
        XCTAssertEqual(ksNormalModeMock.functionCalled, "ggForNonTextElement()")
    }
    
    func test_that_gg_keeps_Vim_in_normal_mode() {
        applyMoveBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
    func test_that_it_resets_the_count() {
        applyMoveBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}

