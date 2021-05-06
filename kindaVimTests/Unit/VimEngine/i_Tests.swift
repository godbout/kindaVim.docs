@testable import kindaVim
import XCTest

class i_Tests: BaseTests {
    
    func test_that_i_does_not_call_any_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .i)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }
    
    func test_that_i_switches_Vim_to_insert_mode() {
        let i = KeyCombination(key: .i)
        VimEngine.shared.handle(keyCombination: i)

        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }

}

