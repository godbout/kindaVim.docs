@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_X__Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
                
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .X))
    }
    
}


extension SucceedingASNM_X__Tests {
    
    func test_that_it_calls_the_correction_function_on_the_AccessibilityStrategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "X(on:_:)")
    }
    
    func test_that_it_keeps_Vim_in_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
