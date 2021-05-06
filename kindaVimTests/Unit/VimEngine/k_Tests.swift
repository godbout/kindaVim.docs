@testable import kindaVim
import XCTest

class k_Tests: BaseTests {
    
    func test_that_k_calls_the_k_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .k)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "k()")
    }
    
    func test_that_k_keeps_Vim_in_command_mode() {
         let k = KeyCombination(key: .k)
         
         VimEngineController.shared.handle(keyCombination: k)

         XCTAssertEqual(VimEngineController.shared.currentMode, .command)
     }
    
}

