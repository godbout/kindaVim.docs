@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_dF__Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .F))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .x))
    }
    
}


extension SucceedingASNM_dF__Tests {
    
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "dF(times:to:on:pgR:)")
    }
    
    func test_that_it_keeps_Vim_in_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
 
}
