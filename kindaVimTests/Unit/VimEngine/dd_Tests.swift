@testable import kindaVim
import XCTest

class dd_Tests: BaseTests {
    
    func test_that_dd_calls_the_dd_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .d)

        VimEngine.shared.handle(keyCombination: keyCombination)
        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "dd()")
    }
    
    func test_that_dd_keeps_Vim_in_command_mode() {
        let d = KeyCombination(key: .d)
        
        VimEngine.shared.handle(keyCombination: d)
        VimEngine.shared.handle(keyCombination: d)

        XCTAssertEqual(VimEngine.shared.currentMode, .command)
    }
    
}

