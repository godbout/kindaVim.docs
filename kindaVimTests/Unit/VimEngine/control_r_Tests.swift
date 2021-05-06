@testable import kindaVim
import XCTest

class control_r_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .r, control: true))
    }

}

extension control_r_Tests {
    
    func test_that_control_r_calls_the_controlR_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "controlR()")
    }
    
    func test_that_control_r_keeps_Vim_in_command_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .command)
    }

}




