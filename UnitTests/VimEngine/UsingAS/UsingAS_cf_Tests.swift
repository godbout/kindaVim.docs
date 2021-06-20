@testable import kindaVim
import XCTest


class UsingAS_cf_Tests: UsingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .f))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .k))        
    }
    
}


// see ct and others for why we don't test Vim mode here but in UI Tests
extension UsingAS_cf_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "cf(to:on:)")
    }
    
}
