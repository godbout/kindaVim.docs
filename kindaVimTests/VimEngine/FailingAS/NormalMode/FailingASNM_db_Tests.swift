@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_db_Tests: FailingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .d))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .b))
    }
    
}


extension FailingASNM_db_Tests {
    
    func test_that_it_does_not_call_any_KS_function_because_it_would_break_the_blockcursor_so_for_now_we_will_just_ignore_ASNM_db() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
}
