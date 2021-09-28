@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_D__Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .D), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_D__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "D()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }

}

