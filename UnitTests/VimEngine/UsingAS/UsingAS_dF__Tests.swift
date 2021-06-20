@testable import kindaVim
import XCTest


class UsingAS_dF__Tests: UsingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .f, shift: true))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .x))        
    }
    
}


extension UsingAS_dF__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "dF(to:on:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}
