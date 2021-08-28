@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_G__Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(vimKey: .G),
            enforceKeyboardStrategy: true
        )
    }

}


extension EnforcingKS_G__Tests {
    
    func test_that_G_calls_the_G_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "G(on:)")
    }
    
    func test_that_G_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}


