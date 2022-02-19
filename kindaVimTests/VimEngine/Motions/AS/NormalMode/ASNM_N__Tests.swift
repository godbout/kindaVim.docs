@testable import kindaVim
import KeyCombination
import XCTest
import Common


class SucceedingASNM_N__Tests: ASNM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .N))
    }
    
}


extension SucceedingASNM_N__Tests {
    
    func test_that_if_there_is_no_lastSearchCommand_it_does_not_call_the_AS_move() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.lastSearchCommand)
        XCTAssertEqual(asNormalModeMock.functionCalled, "")
    }
        
    func test_that_if_there_is_a_lastSearchCommand_then_it_is_forwarded_correctly_as_a_parameter_to_the_AS_move() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .slash))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .two))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastSearchCommand, LastSearchCommand(motion: .slash, searchString: "28"))
        XCTAssertEqual(asNormalModeMock.functionCalled, "N(times:lastSearchCommand:on:)")
        XCTAssertEqual(asNormalModeMock.lastSearchCommandParameter, LastSearchCommand(motion: .slash, searchString: "28"))
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
