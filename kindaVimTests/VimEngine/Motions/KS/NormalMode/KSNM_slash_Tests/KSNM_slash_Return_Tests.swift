@testable import kindaVim
import KeyCombination
import XCTest
import Common


// see AS ? for blah blah
class KSNM_slash_Return_Tests: KSNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .slash))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
    }
    
}


extension KSNM_slash_Return_Tests {
    
    func test_that_if_there_is_no_lastSearchCommand_it_does_not_call_the_KS_move() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.lastSearchCommand)
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
        
    func test_that_if_there_is_a_lastSearchCommand_it_calls_the_correct_function_with_the_lastSearchCommand_searchString() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .slash))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .p))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .p))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .p))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
        
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(ksNormalModeMock.functionCalled, "slash(to:)")
        XCTAssertEqual(ksNormalModeMock.lastSearchCommandParameter, LastSearchCommand(motion: .slash, searchString: "ppp"))
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
