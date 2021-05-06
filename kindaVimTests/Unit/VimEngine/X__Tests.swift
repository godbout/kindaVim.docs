@testable import kindaVim
import XCTest

class X__Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .x, shift: true))
    }

}

extension X__Tests {
    
    func test_that_X_calls_the_X_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "X()")
    }

    func test_that_X_keeps_Vim_in_command_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .command)
    }
    
}




