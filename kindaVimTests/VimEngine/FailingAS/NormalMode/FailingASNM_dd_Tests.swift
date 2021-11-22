@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_dd_Tests: FailingAS_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d), enforceKeyboardStrategy: true)
    }

}


extension FailingASNM_dd_Tests {
    
    func test_that_the_move_calls_the_correct_function_for_TextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineTextElementMock()
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "ddForTextElement()")
    }
    
    func test_that_the_move_calls_the_correct_function_for_NonTextElements_on_KS() {
        kindaVimEngine.axEngine = AXEngineNonTextElementMock()
        applyKeyCombinationsBeingTested()

        XCTAssertEqual(ksNormalModeMock.functionCalled, "ddForNonTextElement()")
    }
    
    func test_that_dd_keeps_Vim_in_normal_mode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        func test_that_it_keeps_Vim_in_normal_mode() {
                XCTAssertEqual(kindaVimEngine.currentMode, .normal)
            }
            
            func test_that_it_resets_the_count() {
                XCTAssertEqual(kindaVimEngine.count, 1)
            }  
        XCTAssertEqual(kindaVimEngine.count, 1)
    }
   
}
