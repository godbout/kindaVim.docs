@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_yiDoubleQuote_Tests: KSNM_BaseTests {
    
    override func setUp() {
super.setUp()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .doubleQuote))
    }
    
}


extension KSNM_yiDoubleQuote_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_implemented() {
        kindaVimEngine.state.lastYankStyle = .linewise
                
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_it_keeps_Vim_in_NormalMode() {
        kindaVimEngine.state.lastYankStyle = .linewise
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_does_not_change_the_LastYankingStyle() {
        kindaVimEngine.state.lastYankStyle = .linewise
        
                
        XCTAssertEqual(kindaVimEngine.state.lastYankStyle, .linewise)
    }
    
    func test_that_it_resets_the_count() {
        kindaVimEngine.state.lastYankStyle = .linewise
                
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
