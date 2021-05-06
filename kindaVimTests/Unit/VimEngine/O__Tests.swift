@testable import kindaVim
import XCTest

class O__Tests: BaseTests {
    
    func test_that_O_calls_the_O_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .o, shift: true)

        VimEngine.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "O()")
    }
    
    func test_that_O_switches_Vim_to_insert_mode() {
        let O = KeyCombination(key: .o, shift: true)
        
        VimEngine.shared.handle(keyCombination: O)

        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }
    
}



