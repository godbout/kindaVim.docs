@testable import kindaVim
import XCTest


class UsingAS_ct_Tests: UsingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .t))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .equal))        
    }
    
}


// this is like ci". sometimes we will go back to edit mode, sometimes
// we will stay in normal mode, so the tests have to be done
// in UI Tests
extension UsingAS_ct_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "ct(to:on:)")
    }
    
}
