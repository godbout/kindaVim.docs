@testable import kindaVim
import XCTest

class o_Tests: BaseTests {
    
    func test_that_o_calls_the_o_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .o)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "o()")
    }
    
    func test_that_o_switches_Vim_to_insert_mode() {
        let o = KeyCombination(key: .o)
        VimEngine.shared.handle(keyCombination: o)

        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }
    
}



