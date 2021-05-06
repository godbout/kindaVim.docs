@testable import kindaVim
import XCTest

class I_Tests: BaseTests {
    
    func test_that_I_switches_Vim_to_insert_mode() {
        let I = KeyCombination(key: .i, shift: true)
        VimEngineController.shared.handle(keyCombination: I)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
    func test_that_I_calls_the_I_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .i, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "I()")
    }

}
