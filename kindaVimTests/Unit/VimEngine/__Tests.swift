@testable import kindaVim
import XCTest

class __Tests: BaseTests {
    
    func test_that___calls_the_underscore_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .minus, shift: true)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "underscore()")
    }
    
    func test_that___keeps_Vim_in_command_mode() {
         let underscore = KeyCombination(key: .minus, shift: true)
         
        VimEngine.shared.handle(keyCombination: underscore)

         XCTAssertEqual(VimEngine.shared.currentMode, .command)
     }
    
}




