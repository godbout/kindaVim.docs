@testable import kindaVim
import KeyCombination
import XCTest
import Common


// see ? for blah blah
class SucceedingASNM_slash_Normal_Tests: ASNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .slash))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .six))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .nine))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
    }
    
}


extension SucceedingASNM_slash_Normal_Tests {
    
    func test_that_it_sets_lastSearchCommand_correctly() {
        XCTAssertNil(kindaVimEngine.lastSearchCommand)
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastSearchCommand, LastSearchCommand(motion: .slash, searchString: "69"))
    }
    
    func test_that_it_calls_the_correct_function_on_AS() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(asNormalModeMock.functionCalled, "slash(times:to:on:)")
        XCTAssertEqual(asNormalModeMock.lastSearchCommandParameter, LastSearchCommand(motion: .slash, searchString: "69"))
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
