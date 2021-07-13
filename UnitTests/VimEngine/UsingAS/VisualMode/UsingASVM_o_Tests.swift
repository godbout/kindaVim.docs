@testable import kindaVim
import XCTest

class UsingASVM_o_Tests: UsingASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .o))
    }
    
}

extension UsingASVM_o_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy_visual_mode() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "o(on:)")
    }
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
    }
    
}
