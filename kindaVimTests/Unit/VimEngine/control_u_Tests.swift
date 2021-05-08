@testable import kindaVim
import XCTest

class control_u_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .u, control: true))
    }

}

extension control_u_Tests {
    
    func test_that_control_u_calls_the_controlU_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "controlU()")
    }
    
    func test_that_control_u_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }

}
