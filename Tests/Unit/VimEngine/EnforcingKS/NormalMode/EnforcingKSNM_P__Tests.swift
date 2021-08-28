@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKSNM_P__Tests: EnforcingKSNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(
            keyCombination: KeyCombination(vimKey: .P),
            enforceKeyboardStrategy: true
        )
    }
    
}


extension EnforcingKSNM_P__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "P()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}

