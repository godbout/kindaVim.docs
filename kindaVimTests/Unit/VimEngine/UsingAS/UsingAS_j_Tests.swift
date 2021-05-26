@testable import kindaVim
import XCTest

class UsingAS_j_Tests: UsingAS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
    }

}

extension UsingAS_j_Tests {

    func test_that_j_calls_the_j_function_on_accessibility_strategy() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "j(on:)")
    }

    func test_that_j_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }

}
