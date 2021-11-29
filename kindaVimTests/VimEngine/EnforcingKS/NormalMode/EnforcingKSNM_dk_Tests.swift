@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_dk_Tests: EnforcingKSNM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .k), appMode: .enforceKeyboardStrategy)
    }

}


extension EnforcingKS_dk_Tests {
    
    func test_that_the_move_calls_the_correct_function_for_TextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        applyKeyCombinationsBeingTested()
       
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dkForTextElement()")
    }
    
    func test_that_the_move_calls_the_correct_function_for_NonTextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        applyKeyCombinationsBeingTested()
       
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dkForNonTextElement()")
    }
    
    func test_that_dk_keeps_Vim_in_normal_mode() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.count, 1)
    }
    
}

