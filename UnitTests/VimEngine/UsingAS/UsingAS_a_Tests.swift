@testable import kindaVim
import XCTest

class UsingAS_a_Tests: UsingAS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .a))
    }

}

extension UsingAS_a_Tests {

    func test_that_a_calls_the_a_function_on_accessibility_strategy() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "a(on:)")
    }

    func test_that_a_switches_Vim_into_insert_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }

}
