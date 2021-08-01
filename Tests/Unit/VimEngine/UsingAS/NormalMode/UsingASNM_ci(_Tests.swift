@testable import kindaVim
import XCTest


class UsingASNM_ciLeftParenthesis_Tests: UsingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .leftParenthesis))
    }
    
}


// see ci" for blah blah
extension UsingASNM_ciLeftParenthesis_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "ciLeftParenthesis(on:)")
    }
    
}
