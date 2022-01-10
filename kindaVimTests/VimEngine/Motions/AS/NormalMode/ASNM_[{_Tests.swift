@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_leftBrackerLeftBrace_Tests: ASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .leftBracket))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .leftBrace))
    }
    
}


extension SucceedingASNM_leftBrackerLeftBrace_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "leftBracketLeftBrace(on:)")
    }
    
    func test_that_it_keeps_Vim_in_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
