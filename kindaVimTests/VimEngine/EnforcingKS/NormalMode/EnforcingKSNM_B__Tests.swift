@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_B__Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(vimKey: .B),
            enforceKeyboardStrategy: true
        )
    }

}


extension EnforcingKS_B__Tests {
    
    func test_that_it_does_not_call_any_KS_function_because_this_move_is_not_doable_with_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
}
