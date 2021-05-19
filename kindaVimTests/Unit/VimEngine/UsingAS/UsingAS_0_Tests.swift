@testable import kindaVim
import XCTest

class UsingAS_0_Tests: UsingAS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .zero))
    }

}

extension UsingAS_0_Tests {

    func test_that_0_calls_the_0_function_on_accessibility_strategy() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "zero(on:)")
    }

    func test_that_0_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }

}
