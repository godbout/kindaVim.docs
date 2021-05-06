@testable import kindaVim
import XCTest

class i_Tests: BaseTests {
    
    func test_that_i_does_not_call_any_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .i)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }
    
    func test_that_i_switches_Vim_to_insert_mode() {
        let i = KeyCombination(key: .i)
        VimEngineController.shared.handle(keyCombination: i)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }

}

