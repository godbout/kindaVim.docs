@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_y_Tests: SucceedingASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
    }
    
}


extension SucceedingASVM_y_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy_visual_mode() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "y(on:)")
    }
    
    func test_that_it_switches_Vim_to_Normal_Mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
