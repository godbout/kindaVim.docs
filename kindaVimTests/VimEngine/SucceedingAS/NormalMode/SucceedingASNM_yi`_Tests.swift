@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_yiBacktick_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.lastYankStyle = .linewise
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .y))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .backtick))
    }
    
}


extension SucceedingASNM_yiBacktick_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "yiBacktick(on:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_sets_the_last_yank_style_to_characterwise() {
        XCTAssertEqual(kindaVimEngine.lastYankStyle, .characterwise)
    }
    
}
