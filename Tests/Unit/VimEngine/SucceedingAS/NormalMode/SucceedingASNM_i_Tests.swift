@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_i_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
    }
    
}


extension SucceedingASNM_i_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "i(on:)")
    }
    
    func test_that_it_switches_Vim_into_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }
    
}
