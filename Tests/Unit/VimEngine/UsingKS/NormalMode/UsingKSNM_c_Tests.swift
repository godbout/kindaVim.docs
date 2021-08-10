@testable import kindaVim
import XCTest

class UsingKS_c_Tests: UsingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
    }

}

extension UsingKS_c_Tests {
    
    func test_that_c_does_not_call_any_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_after_the_first_c_operator_pending_mode_is_on() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .operatorPendingForNormalMode)
    }

}
