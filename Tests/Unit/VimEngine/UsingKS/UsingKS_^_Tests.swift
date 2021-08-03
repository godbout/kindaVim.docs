@testable import kindaVim
import XCTest

class UsingKS_caret_Tests: UsingKS_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .caret))
    }

}

extension UsingKS_caret_Tests {
    
    func test_that_caret_calls_the_caret_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "caret()")
    }

    func test_that_caret_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
