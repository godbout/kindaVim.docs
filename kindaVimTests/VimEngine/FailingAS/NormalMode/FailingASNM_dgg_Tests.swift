@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_dgg_Tests: FailingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .g))
    }
    
}


extension FailingASNM_dgg_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dgg()")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
}
