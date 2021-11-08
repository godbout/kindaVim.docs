@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_r_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .r))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .z))
    }
    
}


extension SucceedingASNM_r_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "r(with:on:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
}
