@testable import kindaVim
import KeyCombination
import XCTest
import Common


// see AS ? for blah blah
class KSNM_interrogationMark_Return_Tests: KSNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .interrogationMark))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
    }
    
}


extension KSNM_interrogationMark_Return_Tests {
    
    func test_that_if_there_is_no_lastSearchCommand_it_does_not_call_the_KS_move() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.lastSearchCommand)
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_if_there_is_a_lastSearchCommand_then_it_sets_the_new_lastSearchCommand_correctly() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .slash))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .o))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
        XCTAssertEqual(kindaVimEngine.lastSearchCommand, LastSearchCommand(motion: .slash, searchString: "go"))
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastSearchCommand, LastSearchCommand(motion: .interrogationMark, searchString: "go"))
    }
        
    func test_that_if_there_is_a_lastSearchCommand_it_calls_the_correct_function_with_the_lastSearchCommand_searchString() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .interrogationMark))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .p))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .p))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .p))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
        
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(ksNormalModeMock.functionCalled, "interrogationMark(to:)")
        XCTAssertEqual(ksNormalModeMock.lastSearchCommandParameter, LastSearchCommand(motion: .interrogationMark, searchString: "ppp"))
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
