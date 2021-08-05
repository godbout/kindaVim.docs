@testable import kindaVim
import XCTest

class UsingKS_l_Tests: UsingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .l))
    }

}

extension UsingKS_l_Tests {
    
    func test_that_l_calls_the_l_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "l()")
    }
    
    func test_that_l_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}


