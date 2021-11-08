@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_rightBracketRightBrace_Tests: FailingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .rightBracket))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .rightBrace))
    }
    
}


extension FailingASNM_rightBracketRightBrace_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_this_move_is_not_implemented() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
}
