@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_gUnderscore_Tests: FailingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .g))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .underscore))
    }
    
}


extension FailingASNM_gUnderscore_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "gUnderscore()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
