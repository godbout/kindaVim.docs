@testable import kindaVim
import XCTest

class UsingKS_dj_Tests: UsingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d), enforceKeyboardStrategy: true)
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .j), enforceKeyboardStrategy: true)
    }

}

extension UsingKS_dj_Tests {
    
    func test_that_dj_calls_the_dj_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dj(on:)")
    }
    
    func test_that_dj_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}

