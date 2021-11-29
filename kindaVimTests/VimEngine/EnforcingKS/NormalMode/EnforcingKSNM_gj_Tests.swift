@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_gj_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .j), appMode: .keyMapping)
    }

}


extension EnforcingKS_gj_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "gj()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }
    
}

