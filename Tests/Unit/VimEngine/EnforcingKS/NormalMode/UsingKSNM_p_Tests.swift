@testable import kindaVim
import XCTest


class UsingKSNM_p_Tests: UsingKSNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(key: .p),
            enforceKeyboardStrategy: true
        )
    }
    
}


extension UsingKSNM_p_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "p()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}

