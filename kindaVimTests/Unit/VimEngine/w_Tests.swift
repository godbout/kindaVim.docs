@testable import kindaVim
import XCTest

class w_Tests: BaseTests {
    
    func test_that_w_calls_the_w_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .w)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "w()")
    }
    
    func test_that_w_keeps_Vim_in_command_mode() {
         let w = KeyCombination(key: .w)
         
        VimEngine.shared.handle(keyCombination: w)

         XCTAssertEqual(VimEngine.shared.currentMode, .command)
     }
    
}




