@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_gCaret_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .g), appMode: .enforceKeyboardStrategy)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .caret), appMode: .enforceKeyboardStrategy)
    }

}


extension EnforcingKS_gCaret_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "gCaret()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
