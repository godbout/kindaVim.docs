@testable import kindaVim
import KeyCombination
import XCTest
import Common


class SucceedingASNM_interrogationMark_Normal_Tests: ASNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .interrogationMark))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .nine))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .six))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
    }
    
}


extension SucceedingASNM_interrogationMark_Normal_Tests {
    
    func test_that_it_sets_lastSearchCommand_correctly() {
        XCTAssertNil(kindaVimEngine.lastSearchCommand)
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastSearchCommand, LastSearchCommand(motion: .interrogationMark, searchString: "96"))
    }

    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(asNormalModeMock.functionCalled, "interrogationMark(times:to:on:)")
        XCTAssertEqual(asNormalModeMock.relevantParameter, "96")
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
