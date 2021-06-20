@testable import kindaVim
import XCTest


class UsingAS_yt_Tests: UsingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .t))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .x, shift: true))
    }
    
}


extension UsingAS_yt_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "yt(to:on:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}
