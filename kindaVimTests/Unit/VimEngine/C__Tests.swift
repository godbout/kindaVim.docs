@testable import kindaVim
import XCTest

class C__Tests: BaseTests {
    
    func test_that_C_calls_the_C_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .c, shift: true)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "C()")
    }
    
    func test_that_C_switches_Vim_to_insert_mode() {
        VimEngine.shared.enterCommandMode()

        let C = KeyCombination(key: .c, shift: true)
        VimEngine.shared.handle(keyCombination: C)

        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }

}

