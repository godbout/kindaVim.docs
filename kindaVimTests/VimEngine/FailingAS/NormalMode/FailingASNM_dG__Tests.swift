@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_dG_Tests: FailingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .d))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .G))
    }
    
}


extension FailingASNM_dG_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dG()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
