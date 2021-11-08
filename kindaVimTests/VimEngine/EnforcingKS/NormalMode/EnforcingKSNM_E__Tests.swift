@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS__E__Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .E), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS__E__Tests {
    
    func test_that_it_does_not_call_any_KS_function_because_this_move_is_not_doable_with_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
}
