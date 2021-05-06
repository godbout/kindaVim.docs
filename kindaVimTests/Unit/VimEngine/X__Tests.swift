@testable import kindaVim
import XCTest

class X__Tests: BaseTests {
    
    func test_that_X_calls_the_X_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .x, shift: true)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "X()")
    }

    func test_that_X_keeps_Vim_in_command_mode() {
         let X = KeyCombination(key: .x, shift: true)
         
        VimEngine.shared.handle(keyCombination: X)

         XCTAssertEqual(VimEngine.shared.currentMode, .command)
     }
    
}




