@testable import kindaVim
import XCTest


class UsingASNM_cF__Tests: UsingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .f, shift: true))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .x))        
    }
    
}


// see ct and others for why we don't test Vim mode here but in UI Tests
extension UsingASNM_cF__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "cF(to:on:)")
    }
    
}
