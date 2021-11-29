@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_$_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .dollarSign), appMode: .keyMapping)
    }

}


extension EnforcingKS_$_Tests {
    
    func test_that_$_calls_the_dollarSign_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dollarSign()")
    }

    func test_that_$_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }
    
}
