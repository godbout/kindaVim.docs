@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_ciw_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))
    }
    
}


extension SucceedingASNM_ciw_Tests {
    
    func test_that_it_calls_the_correct_function_on_AS() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "ciw(on:)")
    }
    
    func test_that_it_switches_Vim_into_insert_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
}
