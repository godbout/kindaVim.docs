@testable import kindaVim
import XCTest

class dgg_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .g))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .g))
    }

}

extension dgg_Tests {

    func test_that_dgg_calls_the_dgg_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "dgg()")
    }

    func test_that_dgg_keeps_Vim_in_command_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .command)
    }

}

