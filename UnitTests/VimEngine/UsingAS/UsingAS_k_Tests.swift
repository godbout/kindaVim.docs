@testable import kindaVim
import XCTest

class UsingAS_k_Tests: UsingAS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
    }

}

extension UsingAS_k_Tests {

    func test_that_k_calls_the_k_function_on_accessibility_strategy() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "k(on:)")
    }

    func test_that_k_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }

}
