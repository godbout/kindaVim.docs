@testable import kindaVim
import XCTest

class a_Tests: BaseTests {
    
    func test_that_a_calls_the_a_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .a)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "a()")
    }
    
    func test_that_a_switches_Vim_to_insert_mode() {
        let a = KeyCombination(key: .a)
        VimEngine.shared.handle(keyCombination: a)

        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }

}
