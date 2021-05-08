@testable import kindaVim
import XCTest

class j_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
    }

}

extension j_Tests {
    
    func test_that_j_calls_the_j_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "j()")
    }
    
    func test_that_j_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}

