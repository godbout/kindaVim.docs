@testable import kindaVim
import XCTest

class h_Tests: BaseTests {
    
    func test_that_h_calls_the_h_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .h)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "h()")
    }
    
    func test_that_h_keeps_Vim_in_command_mode() {
         let h = KeyCombination(key: .h)
         
         VimEngineController.shared.handle(keyCombination: h)

         XCTAssertEqual(VimEngineController.shared.currentMode, .command)
     }

}
