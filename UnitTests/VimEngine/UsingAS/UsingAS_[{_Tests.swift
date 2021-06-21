@testable import kindaVim
import XCTest


class UsingAS_leftBrackerLeftBrace_Tests: UsingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .leftBracket))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .leftBracket, shift: true))
    }
    
}


extension UsingAS_leftBrackerLeftBrace_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "leftBracketLeftBrace(on:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .normal)
    }
    
}