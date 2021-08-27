@testable import kindaVim
import XCTest


class SucceedingASNM_ciDoubleQuote_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .doubleQuote))
    }
    
}


// we do not have the test to see if ci" switches into insert mode here
// and the reason is because it depends.
// if ci" can find quotes, it will go into insert mode
// else it will stay into normal mode.
// so this is tested in the AS UI Tests instead.
extension SucceedingASNM_ciDoubleQuote_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "ciDoubleQuote(on:)")
    }
        
}
