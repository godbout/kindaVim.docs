@testable import kindaVim
import XCTest

class b_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
    }

}

extension b_Tests {
    
    func test_that_b_calls_the_b_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "b()")
    }
    
    func test_that_b_keeps_Vim_in_command_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .command)
    }

}
