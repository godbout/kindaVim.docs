@testable import kindaVim
import KeyCombination
import XCTest
import Common


class SucceedingASNM_semicolon_Tests: ASNM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .semicolon))
    }
    
}


extension SucceedingASNM_semicolon_Tests {

    func test_that_if_there_is_no_lastLeftRightSearch_it_does_not_call_the_AS_move() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.lastLeftRightSearch)
        XCTAssertEqual(asNormalModeMock.functionCalled, "")
    }
        
    func test_that_if_there_is_a_lastLeftRightSearch_then_it_is_forwarded_correctly_as_a_parameter_to_the_AS_move() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .f))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .six))
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastLeftRightSearch, LastLeftRightSearch(motion: .f, character: "6"))
        XCTAssertEqual(asNormalModeMock.functionCalled, "semicolon(times:lastLeftRightSearch:on:)")
        XCTAssertEqual(asNormalModeMock.lastLeftRightSearchParameter, LastLeftRightSearch(motion: .f, character: "6"))
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
