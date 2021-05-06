@testable import kindaVim
import XCTest

class d_Tests: BaseTests {
    
    func test_that_d_does_not_call_any_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .d)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }
    
    func test_that_after_the_first_d_operator_pending_mode_is_on() {
        XCTAssertNotEqual(VimEngineController.shared.currentMode, .operatorPending)

        let d = KeyCombination(key: .d)
        VimEngineController.shared.handle(keyCombination: d)

        XCTAssertEqual(VimEngineController.shared.currentMode, .operatorPending)
    }

}
