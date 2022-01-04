@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_ciDoubleQuote_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .doubleQuote))
    }
    
}


// we do not have the test to see if ci" switches into insert mode here
// and the reason is because it depends.
// if ci" can find quotes, it will go into insert mode
// else it will stay into normal mode.
// so this is tested in the AS UI Tests instead.
extension SucceedingASNM_ciDoubleQuote_Tests {
    
    func test_that_it_calls_the_correction_function_on_the_AccessibilityStrategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "ciDoubleQuote(on:pgR:_:)")
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
        
}
