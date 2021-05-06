@testable import kindaVim
import XCTest

class ci_Tests: BaseTests {
    
    func test_that_ci_does_not_call_any_function_on_keyboard_strategy() {
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .i))

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }
    
    // TODO: to review
//    func test_that_ci_keeps_Vim_in_command_mode() {
//        VimEngineController.shared.handle(keyCombination: (KeyCombination(key: .c)))
//        VimEngineController.shared.handle(keyCombination: (KeyCombination(key: .i)))
////        VimEngineController.shared.handle(keyCombination: (KeyCombination(key: .r)))
//
//        XCTAssertEqual(VimEngineController.shared.currentMode, .command)
//    }
    
    
    
}




