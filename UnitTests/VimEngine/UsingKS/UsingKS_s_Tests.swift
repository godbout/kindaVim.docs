@testable import kindaVim
import XCTest

class UsingKS_s_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .s))
    }

}

extension UsingKS_s_Tests {

    func test_that_s_calls_the_s_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "s()")
    }

    func test_that_s_switches_Vim_to_insert_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }

}
