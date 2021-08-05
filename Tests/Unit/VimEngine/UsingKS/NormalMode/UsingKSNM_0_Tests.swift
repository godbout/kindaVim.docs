@testable import kindaVim
import XCTest

class UsingKS_0_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .zero))
    }

}

extension UsingKS_0_Tests {
    
    func test_that_0_calls_the_zero_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "zero()")
    }
    
    func test_that_0_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}




