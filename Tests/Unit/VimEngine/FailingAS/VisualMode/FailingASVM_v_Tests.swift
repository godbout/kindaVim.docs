@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_v_Tests: FailingASVM_BaseTests {
    
    // it's calling the handleblahblahusingKeyboardStrategy but that itself doesn't call anything
    // those tests are not good
    func test_that_it_does_not_calls_any_KS_function_because_there_is_none_needed_for_that_move() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
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
