@testable import kindaVim
import XCTest


class FailingASNM_yf_Tests: FailingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .f))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k))
    }
    
}


extension FailingASNM_yf_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_implemented() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
}
