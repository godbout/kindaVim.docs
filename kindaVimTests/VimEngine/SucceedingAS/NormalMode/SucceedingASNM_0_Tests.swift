@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_0_Tests: SucceedingASNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(key: .zero))
    }

}


extension SucceedingASNM_0_Tests {

    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "zero(on:)")
    }

    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}
