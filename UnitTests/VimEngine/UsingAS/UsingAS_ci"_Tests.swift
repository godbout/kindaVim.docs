@testable import kindaVim
import XCTest

class UsingAS_ciDoubleQuote_Tests: UsingAS_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .singleQuote, shift: true))
    }
    
}

extension UsingAS_ciDoubleQuote_Tests {
    
    func test_that_ciDoubleQuote_calls_the_ciDoubleQuote_function_on_accessibility_strategy() {
        XCTAssertEqual(accessibilityStrategyMock.functionCalled, "ciDoubleQuote(on:)")
    }
    
    func test_that_ciDoubleQuote_switches_Vim_into_insert_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }
    
}
