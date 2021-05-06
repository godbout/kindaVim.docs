@testable import kindaVim
import XCTest

class gg_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .g))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .g))
    }

}

extension gg_Tests {
    
    func test_that_gg_calls_the_gg_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "gg()")
    }
    
    func test_that_gg_keeps_Vim_in_command_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .command)
    }
    
}

