@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_dt_Tests: FailingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .t))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .equal))
    }
    
}


extension FailingASNM_dt_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_implemented() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
}
