@testable import kindaVim
import XCTest


class SucceedingASVM_c_Tests: SucceedingASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
    }
    
}


extension SucceedingASVM_c_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy_visual_mode() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "c(on:)")
    }
    
    func test_that_it_switches_Vim_into_InsertMode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }
    
}
