@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_ge_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .g), enforceKeyboardStrategy: true)
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .e), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_ge_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "ge()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}
