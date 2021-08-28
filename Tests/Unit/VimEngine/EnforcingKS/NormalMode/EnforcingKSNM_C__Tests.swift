@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_C__Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(vimKey: .C),
            enforceKeyboardStrategy: true
        )
    }

}


extension EnforcingKS_C__Tests {
    
    func test_that_C_calls_the_C_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "C()")
    }
    
    func test_that_C_switches_Vim_to_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }

}

