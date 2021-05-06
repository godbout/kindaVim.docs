@testable import kindaVim
import XCTest

class b_Tests: BaseTests {
    
    func test_that_b_calls_the_b_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .b)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "b()")
    }
    
    func test_that_b_keeps_Vim_in_command_mode() {
        let b = KeyCombination(key: .b)
        VimEngineController.shared.handle(keyCombination: b)

        XCTAssertEqual(VimEngineController.shared.currentMode, .command)
    }

}
