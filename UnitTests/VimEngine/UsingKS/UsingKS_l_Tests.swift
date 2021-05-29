@testable import kindaVim
import XCTest

class UsingKS_l_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        VimEngine.shared.handle(keyCombination: KeyCombination(key: .l))
    }

}

extension UsingKS_l_Tests {
    
    func test_that_l_calls_the_l_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "l()")
    }
    
    func test_that_l_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}


