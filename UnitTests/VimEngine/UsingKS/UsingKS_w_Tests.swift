@testable import kindaVim
import XCTest

class UsingKS_w_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .w))
    }

}

extension UsingKS_w_Tests {
    
    func test_that_w_calls_the_w_function_on_keyboard_strategy() {
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "w()")
    }
    
    func test_that_w_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}




