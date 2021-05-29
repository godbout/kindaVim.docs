@testable import kindaVim
import XCTest

class UsingAS_w_Tests: UsingAS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .w))
    }

}

extension UsingAS_w_Tests {

    func test_that_w_calls_the_w_function_on_accessibility_strategy() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "w(on:)")
    }

    func test_that_w_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }

}
