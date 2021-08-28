@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_a_Tests: SucceedingASNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .a))
    }

}


extension SucceedingASNM_a_Tests {

    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "a(on:)")
    }

    func test_that_it_switches_Vim_into_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }

}
