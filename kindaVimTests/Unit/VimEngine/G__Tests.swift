@testable import kindaVim
import XCTest

class G__Tests: BaseTests {
    
    func test_that_G_calls_the_G_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .g, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "G()")
    }
    
    func test_that_G_keeps_Vim_in_command_mode() {
        let G = KeyCombination(key: .g, shift: true)
        
        VimEngineController.shared.handle(keyCombination: G)

        XCTAssertEqual(VimEngineController.shared.currentMode, .command)
    }
    
    

}


