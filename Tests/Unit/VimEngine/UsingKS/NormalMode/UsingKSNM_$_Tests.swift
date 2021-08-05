@testable import kindaVim
import XCTest

class UsingKS_$_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
    }

}

extension UsingKS_$_Tests {
    
    func test_that_$_calls_the_dollarSign_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dollarSign()")
    }

    func test_that_$_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
