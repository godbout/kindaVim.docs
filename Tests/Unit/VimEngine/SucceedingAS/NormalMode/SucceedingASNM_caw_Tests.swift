@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_caw_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .a))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .w))
    }
    
}


extension SucceedingASNM_caw_Tests {
    
    func test_that_it_calls_the_correct_function_on_AS() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "caw(on:)")
    }
    
    func test_that_it_switches_Vim_into_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }
    
}
