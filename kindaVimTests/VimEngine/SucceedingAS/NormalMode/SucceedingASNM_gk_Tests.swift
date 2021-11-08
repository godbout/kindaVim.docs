@testable import kindaVim
import KeyCombination
import XCTest


// see j for blah blah
class SucceedingASNM_gk_Tests: SucceedingASNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .k))
    }

}


extension SucceedingASNM_gk_Tests {

    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "gk(on:)")
    }

    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }

}
