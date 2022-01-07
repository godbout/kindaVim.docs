@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingASNM_yiBacktickQuote_Tests: KSNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .backtick), appMode: .keyMapping)
    }
    
}


extension EnforcingASNM_yiBacktickQuote_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_implemented() {
        kindaVimEngine.state.lastYankStyle = .linewise
                
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        kindaVimEngine.state.lastYankStyle = .linewise
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        kindaVimEngine.state.lastYankStyle = .linewise
                
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
