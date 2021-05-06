@testable import kindaVim
import XCTest

class g_Tests: BaseTests {
    
    func test_that_g_does_not_call_any_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .g)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }
    
    func test_that_after_the_first_g_operator_pending_mode_is_on() {
        XCTAssertNotEqual(VimEngineController.shared.currentMode, .operatorPending)

        let g = KeyCombination(key: .g)
        VimEngineController.shared.handle(keyCombination: g)

        XCTAssertEqual(VimEngineController.shared.currentMode, .operatorPending)
    }

}

