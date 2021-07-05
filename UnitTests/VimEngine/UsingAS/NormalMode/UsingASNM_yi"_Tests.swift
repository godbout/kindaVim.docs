@testable import kindaVim
import XCTest


class UsingASNM_yiDoubleQuote_Tests: UsingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .y))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .doubleQuote))
    }
    
}


extension UsingASNM_yiDoubleQuote_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "yiDoubleQuote(on:)")
    }
    
    func test_that_l_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}
