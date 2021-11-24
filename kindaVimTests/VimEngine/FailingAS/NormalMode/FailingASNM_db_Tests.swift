@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_db_Tests: FailingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .b))
    }
    
}


extension FailingASNM_db_Tests {
    
    func test_that_it_does_not_call_any_KS_function_because_it_would_break_the_blockcursor_so_for_now_we_will_just_ignore_ASNM_db() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }
    
}
