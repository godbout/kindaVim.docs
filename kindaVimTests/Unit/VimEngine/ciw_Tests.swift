@testable import kindaVim
import XCTest

class ciw_Tests: BaseTests {
    
    func test_that_ciw_calls_the_ciw_function_on_keyboard_strategy() {
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .i))
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .w))

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "ciw()")
    }
    
    func test_that_ciw_switches_Vim_to_insert_mode() {
        VimEngineController.shared.enterCommandMode()

        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .i))
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .w))

        XCTAssertEqual(VimEngineController.shared.currentMode, .insert)
    }
    
}




