@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_n_Tests: KSNM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .n))
    }
    
}


extension KSNM_n_Tests {
    
    func test_that_if_the_LastSearchCommand_called_was_slash_then_it_calls_the_KS_func_with_the_correct_lastSearchCommand_parameter() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .slash))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .m))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastSearchCommand?.motion, .slash)
        XCTAssertEqual(kindaVimEngine.lastSearchCommand?.searchString, "ama")
        XCTAssertEqual(ksNormalModeMock.functionCalled, "n(times:lastSearchCommand:)")
        XCTAssertEqual(ksNormalModeMock.relevantParameter, "/")
    }
    
    func test_that_if_the_LastSearchCommand_called_was_interrogationMark_then_it_calls_the_KS_func_with_the_correct_lastSearchCommand_parameter() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .interrogationMark))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .six))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .nine))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .backspace))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .N))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastSearchCommand?.motion, .interrogationMark)
        XCTAssertEqual(kindaVimEngine.lastSearchCommand?.searchString, "6N")
        XCTAssertEqual(ksNormalModeMock.functionCalled, "n(times:lastSearchCommand:)")
        XCTAssertEqual(ksNormalModeMock.relevantParameter, "?")
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
