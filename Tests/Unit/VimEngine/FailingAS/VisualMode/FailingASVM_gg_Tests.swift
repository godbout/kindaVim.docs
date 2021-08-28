@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_gg_Tests: FailingASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .g))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .g))
    }
    
}


extension FailingASVM_gg_Tests {
    
    func test_that_it_calls_the_relevant_KS_function_as_a_fallback() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "gg()")
    }
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
    }
    
}
