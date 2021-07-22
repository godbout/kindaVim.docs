@testable import kindaVim
import XCTest


class UsingASNM_yy_Tests: UsingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.lastYankStyle = .characterwise
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
    }
    
}


extension UsingASNM_yy_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "yy(on:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
    func test_that_it_sets_the_last_yank_style_to_linewise() {
        XCTAssertEqual(KindaVimEngine.shared.lastYankStyle, .linewise)
    }
    
}
