@testable import kindaVim
import XCTest

class x_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .x))
    }

}

extension x_Tests {
    
    func test_that_x_calls_the_x_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "x()")
    }
    
    func test_that_x_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}




