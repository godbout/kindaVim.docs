@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_daw_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))
    }
    
}


extension SucceedingASNM_daw_Tests {
    
    func test_that_it_calls_the_correct_function_on_the_AccesssibilityStrategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "daw(on:pgR:_:)")
    }
    
    func test_that_it_keeps_Vim_in_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
  
}
