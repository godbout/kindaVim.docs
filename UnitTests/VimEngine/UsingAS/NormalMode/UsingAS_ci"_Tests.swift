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

// we do not have the test to see if ci" switches into insert mode here
// and the reason is because it depends.
// if ci" can find quotes, it will go into insert mode
// else it will stay into normal mode.
// so this is tested in the AS UI Tests instead.
extension UsingAS_ciDoubleQuote_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "ciDoubleQuote(on:)")
    }
        
}
