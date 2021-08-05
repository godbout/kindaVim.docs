@testable import kindaVim
import XCTest

class UsingKS_X__Tests: UsingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .X))
    }

}

extension UsingKS_X__Tests {
    
    func test_that_X_calls_the_X_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "X()")
    }

    func test_that_X_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}




