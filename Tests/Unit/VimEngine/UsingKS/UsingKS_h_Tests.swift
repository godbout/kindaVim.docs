@testable import kindaVim
import XCTest

class UsingKS_h_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .h))
    }

}

extension UsingKS_h_Tests {
    
    func test_that_h_calls_the_h_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "h()")
    }
    
    func test_that_h_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}
