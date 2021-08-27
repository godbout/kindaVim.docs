@testable import kindaVim
import XCTest


class SucceedingASVM_v_Tests: SucceedingASVM_BaseTests {
        
    func test_that_it_calls_the_correct_function_on_accessibility_strategy_visual_mode() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "v(on:)")
    }
        
    func test_that_if_Vim_was_in_visual_mode_characterwise_it_switches_into_normal_mode() {
        KindaVimEngine.shared.visualStyle = .characterwise
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
    func test_that_if_Vim_was_in_visual_mode_linewise_it_switches_into_visual_mode_characterwise() {
        KindaVimEngine.shared.visualStyle = .linewise
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
        XCTAssertEqual(KindaVimEngine.shared.visualStyle, .characterwise)
    }
    
}
