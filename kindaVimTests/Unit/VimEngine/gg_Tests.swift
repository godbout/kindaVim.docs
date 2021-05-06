@testable import kindaVim
import XCTest

class gg_Tests: BaseTests {
    
    func test_that_gg_calls_the_gg_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .g)

        VimEngineController.shared.handle(keyCombination: keyCombination)
        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "gg()")
    }
    
    func test_that_gg_keeps_Vim_in_command_mode() {
        let g = KeyCombination(key: .g)
        
        VimEngineController.shared.handle(keyCombination: g)
        VimEngineController.shared.handle(keyCombination: g)

        XCTAssertEqual(VimEngineController.shared.currentMode, .command)
    }
    
}

