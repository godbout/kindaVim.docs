@testable import kindaVim
import XCTest

class l_Tests: BaseTests {
    
    func test_that_l_calls_the_l_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .l)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "l()")
    }
    
    func test_that_l_keeps_Vim_in_command_mode() {
         let l = KeyCombination(key: .l)
         
         VimEngineController.shared.handle(keyCombination: l)

         XCTAssertEqual(VimEngineController.shared.currentMode, .command)
     }
    
}


