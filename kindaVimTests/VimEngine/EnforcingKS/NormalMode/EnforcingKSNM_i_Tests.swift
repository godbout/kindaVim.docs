@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_i_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .i), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_i_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "i()")
    }
    
    func test_that_i_switches_Vim_to_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }

}

