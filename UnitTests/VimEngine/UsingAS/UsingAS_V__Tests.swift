@testable import kindaVim
import XCTest


class UsingAS_V__Tests: UsingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))
    }
    
}


extension UsingAS_V__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "V(on:)")
    }
    
    func test_that_it_switches_Vim_to_visual_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .visual)
    }
    
    func test_that_it_sets_the_visual_style_to_linewise() {
        XCTAssertEqual(VimEngine.shared.visualStyle, .linewise)
    }
    
    func test_that_a_second_call_to_V_switches_back_to_normal_mode() {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .v, shift: true))
        
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}
