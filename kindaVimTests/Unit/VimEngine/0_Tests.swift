@testable import kindaVim
import XCTest

class _0_Tests: BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .zero))
    }

}

extension _0_Tests {
    
    func test_that_0_calls_the_zero_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "zero()")
    }
    
    func test_that_0_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}




