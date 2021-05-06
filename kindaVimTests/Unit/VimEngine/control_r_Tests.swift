@testable import kindaVim
import XCTest

class control_r_Tests: BaseTests {
    
    func test_that_control_r_calls_the_controlR_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .r, control: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "controlR()")
    }
    
    func test_that_control_r_keeps_Vim_in_command_mode() {
         let controlR = KeyCombination(key: .r, control: true)
         
         VimEngineController.shared.handle(keyCombination: controlR)

         XCTAssertEqual(VimEngineController.shared.currentMode, .command)
     }

}




