@testable import kindaVim
import XCTest

class UsingKS_d_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
    }

}

extension UsingKS_d_Tests {
    
    func test_that_d_does_not_call_any_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_after_the_first_d_operator_pending_mode_is_on() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .operatorPending)
    }

}
