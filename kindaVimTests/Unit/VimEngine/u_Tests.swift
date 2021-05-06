@testable import kindaVim
import XCTest

class u_Tests: BaseTests {
    
    func test_that_u_calls_the_u_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .u)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "u()")
    }
    
    func test_that_u_keeps_Vim_in_command_mode() {
         let u = KeyCombination(key: .u)
         
         VimEngineController.shared.handle(keyCombination: u)

         XCTAssertEqual(VimEngineController.shared.currentMode, .command)
     }
    
}




