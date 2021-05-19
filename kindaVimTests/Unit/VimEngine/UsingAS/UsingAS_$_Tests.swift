@testable import kindaVim
import XCTest

class UsingAS_$_Tests: UsingAS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .four, shift: true))
    }

}

extension UsingAS_$_Tests {

    func test_that_$_calls_the_$_function_on_accessibility_strategy() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "dollarSign(on:)")
    }

    func test_that_$_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }

}
