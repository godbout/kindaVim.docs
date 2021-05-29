@testable import kindaVim
import XCTest

class UsingKS_r_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .r))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .g))
    }

}

extension UsingKS_r_Tests {

    func test_that_r_calls_the_r_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "r(with:)")
    }

    func test_that_k_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }

}


