@testable import kindaVim
import XCTest

class yy_Tests: BaseTests {

    func test_that_yy_calls_the_yy_function_on_keyboard_strategy() {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .y))

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "yy()")
    }

    func test_that_yy_keeps_Vim_in_command_mode() {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .y))

        XCTAssertEqual(VimEngine.shared.currentMode, .command)
    }

}

