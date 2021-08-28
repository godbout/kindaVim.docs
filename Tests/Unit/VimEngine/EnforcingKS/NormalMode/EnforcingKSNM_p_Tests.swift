@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSNM_p_Tests: EnforcingKSNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(key: .p),
            enforceKeyboardStrategy: true
        )
    }
    
}


extension EnforcingKSNM_p_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "p()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}

