@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_e_Tests: FailingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .e))
    }
    
}


extension FailingASNM_e_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "e()")
    }
    
}
