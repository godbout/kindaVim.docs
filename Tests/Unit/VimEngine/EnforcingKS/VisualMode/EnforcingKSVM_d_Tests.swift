@testable import kindaVim
import XCTest


class EnforcingKSVM_d_Tests: EnforcingKSVM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(key: .d),
            enforceKeyboardStrategy: true
        )
    }

}


extension EnforcingKSVM_d_Tests {

    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "d()")
    }
    
    func test_that_it_switches_Vim_into_NormalMode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}
