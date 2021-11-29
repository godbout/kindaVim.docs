@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_dj_Tests: EnforcingKSNM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .j), appMode: .enforceKeyboardStrategy)
    }

}


extension EnforcingKS_dj_Tests {
    
    func test_that_the_move_calls_the_correct_function_for_TextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        applyKeyCombinationsBeingTested()
       
        XCTAssertEqual(ksNormalModeMock.functionCalled, "djForTextElement()")
    }
    
    func test_that_the_move_calls_the_correct_function_for_NonTextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        applyKeyCombinationsBeingTested()
       
        XCTAssertEqual(ksNormalModeMock.functionCalled, "djForNonTextElement()")
    }
    
    func test_that_dj_keeps_Vim_in_normal_mode() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.count, 1)
    }
    
}

