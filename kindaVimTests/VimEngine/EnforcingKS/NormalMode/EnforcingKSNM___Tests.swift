@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS___Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(vimKey: .underscore),
            enforceKeyboardStrategy: true
        )
    }

}


extension EnforcingKS___Tests {
    
    func test_that___calls_the_underscore_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "underscore()")
    }
    
    func test_that___keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
