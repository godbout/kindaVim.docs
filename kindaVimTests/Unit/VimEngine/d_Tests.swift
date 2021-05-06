@testable import kindaVim
import XCTest

class d_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
    }

}

extension d_Tests {
    
    func test_that_d_does_not_call_any_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }
    
    func test_that_after_the_first_d_operator_pending_mode_is_on() {
        XCTAssertEqual(VimEngine.shared.currentMode, .operatorPending)
    }

}
