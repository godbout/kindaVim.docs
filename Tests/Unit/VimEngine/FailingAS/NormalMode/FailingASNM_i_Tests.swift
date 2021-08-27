@testable import kindaVim
import XCTest


class FailingASNM_i_Tests: FailingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
    }
    
}


extension FailingASNM_i_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_there_is_none_needed_for_that_move() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_it_switches_Vim_into_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }
    
}
