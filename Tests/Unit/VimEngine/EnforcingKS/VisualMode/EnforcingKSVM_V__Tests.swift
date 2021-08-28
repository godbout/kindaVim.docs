@testable import kindaVim
import XCTest


class EnforcingKSVM_V__Tests: EnforcingKSVM_BaseTests {}


extension EnforcingKSVM_V__Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_there_is_none_needed_for_that_move() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_if_Vim_was_in_visual_mode_linewise_it_switches_into_normal_mode() {
        KindaVimEngine.shared.visualStyle = .linewise
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
    func test_that_if_Vim_was_in_visual_mode_characterwise_it_switches_into_visual_mode_linewise() {
        KindaVimEngine.shared.visualStyle = .characterwise
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
        XCTAssertEqual(KindaVimEngine.shared.visualStyle, .linewise)
    }
    
}
