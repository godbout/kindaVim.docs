@testable import kindaVim
import XCTest

class G__Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .g, shift: true))
    }

}

extension G__Tests {
    
    func test_that_G_calls_the_G_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "G()")
    }
    
    func test_that_G_keeps_Vim_in_command_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .command)
    }
    
}


