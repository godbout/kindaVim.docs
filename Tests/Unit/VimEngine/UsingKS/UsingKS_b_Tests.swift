@testable import kindaVim
import XCTest

class UsingKS_b_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
    }

}

extension UsingKS_b_Tests {
    
    func test_that_b_calls_the_b_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "b()")
    }
    
    func test_that_b_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}
