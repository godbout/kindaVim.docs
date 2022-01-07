@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_X__Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .X))
    }
    
}


extension SucceedingASVM_X__Tests {
    
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "X(on:_:)")
    }
    
    func test_that_it_switches_Vim_into_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
