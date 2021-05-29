@testable import kindaVim
import XCTest

class UsingAS_b_Tests: UsingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .b))
    }
    
}

extension UsingAS_b_Tests {
    
    func test_that_b_calls_the_b_function_on_accessibility_strategy() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "b(on:)")
    }
    
    func test_that_b_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}
