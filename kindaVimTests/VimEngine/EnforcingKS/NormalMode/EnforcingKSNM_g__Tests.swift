@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_gUnderscore_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .g), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .underscore), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_gUnderscore_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "gUnderscore()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
}
