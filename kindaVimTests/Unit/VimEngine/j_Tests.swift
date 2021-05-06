@testable import kindaVim
import XCTest

class j_Tests: BaseTests {
    
    func test_that_j_calls_the_j_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .j)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "j()")
    }
    
    func test_that_j_keeps_Vim_in_command_mode() {
         let j = KeyCombination(key: .j)
         
        VimEngine.shared.handle(keyCombination: j)

         XCTAssertEqual(VimEngine.shared.currentMode, .command)
     }
}

