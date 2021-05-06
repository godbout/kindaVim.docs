@testable import kindaVim
import XCTest

class _$_Tests: BaseTests {
    
    func test_that_$_calls_the_dollarSign_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .four, shift: true)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "dollarSign()")
    }

    func test_that_$_keeps_Vim_in_command_mode() {
         let dollarSign = KeyCombination(key: .four, shift: true)
         
        VimEngine.shared.handle(keyCombination: dollarSign)

         XCTAssertEqual(VimEngine.shared.currentMode, .command)
     }
    
}




