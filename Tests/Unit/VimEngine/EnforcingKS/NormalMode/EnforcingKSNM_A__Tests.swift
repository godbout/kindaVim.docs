@testable import kindaVim
import XCTest


class EnforcingKS_A__Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(vimKey: .A),
            enforceKeyboardStrategy: true
        )
    }

}


extension EnforcingKS_A__Tests {
    
    func test_that_A_calls_the_A_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "A()")
    }
    
    func test_that_A_switches_Vim_to_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }

}
