@testable import kindaVim
import XCTest

class k_Tests: BaseTests {
    
    func test_that_k_calls_the_k_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .k)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "k()")
    }
    
    func test_that_k_keeps_Vim_in_command_mode() {
         let k = KeyCombination(key: .k)
         
        VimEngine.shared.handle(keyCombination: k)

         XCTAssertEqual(VimEngine.shared.currentMode, .command)
     }
    
}

