@testable import kindaVim
import XCTest

class UsingASVM_j_Tests: UsingASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .j))
    }
    
}

extension UsingASVM_j_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy_visual_mode() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "j(on:)")
    }
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .visual)
    }
    
}
