@testable import kindaVim
import XCTest


class UsingASNM_cT__Tests: UsingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .t, shift: true))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .a))        
    }
    
}


// this is like ci". sometimes we will go back to edit mode, sometimes
// we will stay in normal mode, so the tests have to be done
// in UI Tests
extension UsingASNM_cT__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "cT(to:on:)")
    }
    
}
