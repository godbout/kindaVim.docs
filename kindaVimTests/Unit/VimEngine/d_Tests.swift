@testable import kindaVim
import XCTest

class d_Tests: BaseTests {
    
    func test_that_d_does_not_call_any_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .d)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }
    
    func test_that_after_the_first_d_operator_pending_mode_is_on() {
        XCTAssertNotEqual(VimEngine.shared.currentMode, .operatorPending)

        let d = KeyCombination(key: .d)
        VimEngine.shared.handle(keyCombination: d)

        XCTAssertEqual(VimEngine.shared.currentMode, .operatorPending)
    }

}
