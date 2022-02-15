@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_n_Tests: ASNM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .n))
    }
    
}


extension SucceedingASNM_n_Tests {
    
    func test_that_if_the_LastSearchCommand_called_was_slash_then_it_calls_slash_with_the_right_searchString_as_parameter() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .slash))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .m))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastSearchCommand?.motion, "/")
        XCTAssertEqual(kindaVimEngine.lastSearchCommand?.searchString, "ama")
        XCTAssertEqual(asNormalModeMock.functionCalled, "slash(times:to:on:)")
        XCTAssertEqual(asNormalModeMock.relevantParameter, "ama")
    }
    
    func test_that_if_the_LastSearchCommand_called_was_interrogationMark_then_it_calls_interrogationMark_with_the_right_searchString_as_parameter() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .interrogationMark))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .six))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .nine))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .backspace))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .N))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastSearchCommand?.motion, "?")
        XCTAssertEqual(kindaVimEngine.lastSearchCommand?.searchString, "6N")
        XCTAssertEqual(asNormalModeMock.functionCalled, "interrogationMark(times:to:on:)")
        XCTAssertEqual(asNormalModeMock.relevantParameter, "6N")
    }
    
    func test_that_it_keeps_Vim_in_NormalMode() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }

}
