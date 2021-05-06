@testable import kindaVim
import XCTest

class h_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .h))
    }

}

extension h_Tests {
    
    func test_that_h_calls_the_h_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "h()")
    }
    
    func test_that_h_keeps_Vim_in_command_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .command)
    }

}
