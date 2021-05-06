@testable import kindaVim
import XCTest

class _$_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .four, shift: true))
    }

}

extension _$_Tests {
    
    func test_that_$_calls_the_dollarSign_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "dollarSign()")
    }

    func test_that_$_keeps_Vim_in_command_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .command)
    }
    
}




