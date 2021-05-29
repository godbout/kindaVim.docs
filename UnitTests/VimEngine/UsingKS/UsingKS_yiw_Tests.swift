@testable import kindaVim
import XCTest

class UsingKS_yiw_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .w))
    }

}

extension UsingKS_yiw_Tests {

    func test_that_yiw_calls_the_ciw_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "yiw()")
    }

    func test_that_yiw_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }

}
