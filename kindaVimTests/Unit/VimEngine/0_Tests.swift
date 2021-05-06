@testable import kindaVim
import XCTest

class _0_Tests: BaseTests {
    
    func test_that_0_calls_the_zero_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .zero)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "zero()")
    }
    
    func test_that_0_keeps_Vim_in_command_mode() {
         let zero = KeyCombination(key: .zero)
         
        VimEngine.shared.handle(keyCombination: zero)

         XCTAssertEqual(VimEngine.shared.currentMode, .command)
     }
    
}




