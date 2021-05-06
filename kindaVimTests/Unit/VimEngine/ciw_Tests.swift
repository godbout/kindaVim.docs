@testable import kindaVim
import XCTest

class ciw_Tests: BaseTests {
    
    func test_that_ciw_calls_the_ciw_function_on_keyboard_strategy() {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .w))

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "ciw()")
    }
    
    func test_that_ciw_switches_Vim_to_insert_mode() {
        VimEngine.shared.enterCommandMode()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .w))

        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }
    
}




