@testable import kindaVim
import XCTest

class A__Tests: BaseTests {
    
    func test_that_A_calls_the_A_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .a, shift: true)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "A()")
    }
    
    func test_that_A_switches_Vim_to_insert_mode() {
        let A = KeyCombination(key: .a, shift: true)
        VimEngine.shared.handle(keyCombination: A)

        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }

}

