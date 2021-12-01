@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_ciLeftParenthesis_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .leftParenthesis))
    }
    
}


// see ci" for blah blah
extension SucceedingASNM_ciLeftParenthesis_Tests {
    
    func test_that_in_Auto_Mode_it_calls_the_correct_function_on_AS_with_PGR_off() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "ciLeftParenthesis(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, false)
    }
    
    func test_that_in_PGR_Mode_it_calls_the_correct_function_on_AS_with_PGR_on() {
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .leftParenthesis), appMode: .pgR)
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "ciLeftParenthesis(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, true)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }
  
}
