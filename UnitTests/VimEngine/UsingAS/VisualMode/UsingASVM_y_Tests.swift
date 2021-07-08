@testable import kindaVim
import XCTest

class UsingASVM_y_Tests: UsingASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
    }
    
}

extension UsingASVM_y_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy_visual_mode() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "y(on:)")
    }
    
    func test_that_it_switches_Vim_to_Normal_Mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}
