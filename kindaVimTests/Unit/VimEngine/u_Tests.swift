@testable import kindaVim
import XCTest

class u_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .u))
    }

}

extension u_Tests {
    
    func test_that_u_calls_the_u_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "u()")
    }
    
    func test_that_u_keeps_Vim_in_command_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .command)
    }
    
}




