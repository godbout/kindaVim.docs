@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_db_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
    }
    
}


extension SucceedingASNM_db_Tests {
    
    func test_that_currently_it_does_not_call_the_function_on_AS_because_it_is_not_built_yet() {
        XCTAssertNotEqual(asNormalModeMock.functionCalled, "db(on:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
