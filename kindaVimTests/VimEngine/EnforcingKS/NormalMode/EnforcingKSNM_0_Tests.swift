@testable import kindaVim
import KeyCombination
import XCTest


// see Succeeding AS NM 0 for blah blah
class EnforcingKS_0_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(key: .zero), appMode: .keyMapping)
    }

}


extension EnforcingKS_0_Tests {
    
    func test_that_0_calls_the_zero_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "zero()")
    }
    
    func test_that_0_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
}
