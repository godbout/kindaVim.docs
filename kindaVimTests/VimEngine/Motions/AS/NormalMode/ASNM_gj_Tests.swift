@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_gj_Tests: ASNM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .j))
    }

}


extension SucceedingASNM_gj_Tests {
    
    func test_that_if_we_are_on_a_TextField_it_does_not_use_the_AS_but_uses_the_KS_instead() {
        kindaVimEngine.accessibilityStrategy = AccessibilityStrategySucceedingTextFieldMock()
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "")
        XCTAssertEqual(ksNormalModeMock.functionCalled, "gj()")
    }

    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(asNormalModeMock.functionCalled, "gj(on:)")
    }

    func test_that_it_keeps_Vim_in_NormalMode() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }

}
