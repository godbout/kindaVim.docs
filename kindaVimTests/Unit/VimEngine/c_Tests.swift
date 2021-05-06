@testable import kindaVim
import XCTest

class c_Tests: BaseTests {
    
    func test_that_c_does_not_call_any_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .c)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }
    
    func test_that_after_the_first_c_operator_pending_mode_is_on() {
        XCTAssertNotEqual(VimEngine.shared.currentMode, .operatorPending)

        let c = KeyCombination(key: .c)
        VimEngine.shared.handle(keyCombination: c)

        XCTAssertEqual(VimEngine.shared.currentMode, .operatorPending)
    }

}
