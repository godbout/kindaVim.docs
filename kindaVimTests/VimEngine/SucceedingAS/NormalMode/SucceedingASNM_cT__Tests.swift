@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_cT__Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .T))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
    }
    
}


// this is like ci". sometimes we will go back to edit mode, sometimes
// we will stay in normal mode, so the tests have to be done
// in UI Tests
extension SucceedingASNM_cT__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "cT(to:on:)")
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
