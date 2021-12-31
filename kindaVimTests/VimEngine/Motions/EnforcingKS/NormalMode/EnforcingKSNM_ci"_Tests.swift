@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingASNM_ciDoubleQuote_Tests: FailingASNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .doubleQuote), appMode: .keyMapping)
    }
    
}


extension EnforcingASNM_ciDoubleQuote_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_implemented() {
        kindaVimEngine.lastYankStyle = .linewise
                
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        kindaVimEngine.lastYankStyle = .linewise
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_does_not_change_the_LastYankingStyle() {
        kindaVimEngine.lastYankStyle = .linewise
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.lastYankStyle, .linewise)
    }
    
    func test_that_it_resets_the_count() {
        kindaVimEngine.lastYankStyle = .linewise
                
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
