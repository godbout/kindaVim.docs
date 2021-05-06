@testable import kindaVim
import XCTest

class gg_Tests: BaseTests {
    
    func test_that_gg_calls_the_gg_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .g)

        VimEngine.shared.handle(keyCombination: keyCombination)
        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "gg()")
    }
    
    func test_that_gg_keeps_Vim_in_command_mode() {
        let g = KeyCombination(key: .g)
        
        VimEngine.shared.handle(keyCombination: g)
        VimEngine.shared.handle(keyCombination: g)

        XCTAssertEqual(VimEngine.shared.currentMode, .command)
    }
    
}

