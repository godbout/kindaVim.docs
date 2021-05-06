@testable import kindaVim
import XCTest

class k_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
    }

}

extension k_Tests {

    func test_that_k_calls_the_k_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "k()")
    }
    
    func test_that_k_keeps_Vim_in_command_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .command)
    }
    
}

