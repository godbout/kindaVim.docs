@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_ct_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .t))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .equal))
    }
    
}


// this is like ci". sometimes we will go back to edit mode, sometimes
// we will stay in normal mode, so the tests have to be done
// in UI Tests
extension SucceedingASNM_ct_Tests {
    
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "ct(times:to:on:pgR:_:)")
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
 
}
