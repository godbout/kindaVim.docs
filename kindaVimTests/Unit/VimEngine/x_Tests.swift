@testable import kindaVim
import XCTest

class x_Tests: BaseTests {
    
    func test_that_x_calls_the_x_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .x)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "x()")
    }
    
    func test_that_x_keeps_Vim_in_command_mode() {
         let x = KeyCombination(key: .x)
         
        VimEngine.shared.handle(keyCombination: x)

         XCTAssertEqual(VimEngine.shared.currentMode, .command)
     }
    
}




