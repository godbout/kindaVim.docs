@testable import kindaVim
import XCTest


class EnforcingKS_O__Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(vimKey: .O),
            enforceKeyboardStrategy: true
        )
    }

}


extension EnforcingKS_O__Tests {
    
    func test_that_O_calls_the_O_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "O()")
    }
    
    func test_that_O_switches_Vim_to_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }
    
}



