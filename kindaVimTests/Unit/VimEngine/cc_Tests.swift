@testable import kindaVim
import XCTest

class cc_Tests: BaseTests {
    
    func test_that_cc_calls_the_cc_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .c)

        VimEngineController.shared.handle(keyCombination: keyCombination)
        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "cc()")
    }
    
    func test_that_cc_switches_Vim_to_insert_mode() {
        VimEngineController.shared.enterCommandMode()

        let c = KeyCombination(key: .c)
        VimEngineController.shared.handle(keyCombination: c)
        VimEngineController.shared.handle(keyCombination: c)

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }

}
