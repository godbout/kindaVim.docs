@testable import kindaVim
import XCTest

class w_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .w))
    }

}

extension w_Tests {
    
    func test_that_w_calls_the_w_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "w()")
    }
    
    func test_that_w_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}




