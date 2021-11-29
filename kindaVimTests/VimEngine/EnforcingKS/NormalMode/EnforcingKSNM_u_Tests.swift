@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_u_Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .keyMapping)
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .u), appMode: .keyMapping)
    }

}


extension EnforcingKS_u_Tests {
    
    func test_that_u_calls_the_u_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "u()")
    }
    
    func test_that_u_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
