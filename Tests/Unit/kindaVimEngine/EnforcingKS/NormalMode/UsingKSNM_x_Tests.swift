@testable import kindaVim
import XCTest

class UsingKS_x_Tests: UsingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(key: .x),
            enforceKeyboardStrategy: true
        )
    }

}

extension UsingKS_x_Tests {
    
    func test_that_x_calls_the_x_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "x()")
    }
    
    func test_that_x_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
