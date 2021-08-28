@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_$_Tests: SucceedingASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
    }
    
}


extension SucceedingASVM_$_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy_visual_mode() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "dollarSign(on:)")
    }
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
    }
    
}
