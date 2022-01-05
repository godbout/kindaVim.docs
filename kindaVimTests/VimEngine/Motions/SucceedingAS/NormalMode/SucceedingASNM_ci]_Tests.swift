@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_ciRightBracket_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .rightBracket))
    }
    
}


// see ci" for blah blah
extension SucceedingASNM_ciRightBracket_Tests {
    
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "ciRightBracket(on:_:)")
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
  
}
