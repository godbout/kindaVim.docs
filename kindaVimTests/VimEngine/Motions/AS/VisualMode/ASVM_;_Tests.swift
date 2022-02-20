@testable import kindaVim
import KeyCombination
import XCTest
import Common


class SucceedingASVM_semicolon_Tests: ASVM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .semicolon))
    }
    
}


extension SucceedingASVM_semicolon_Tests {

    func test_that_if_there_is_no_lastLeftRightSearch_it_does_not_call_the_AS_move() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.lastLeftRightSearch)
        XCTAssertEqual(asVisualModeMock.functionCalled, "")
    }
        
    func test_that_if_there_is_a_lastLeftRightSearch_then_it_is_forwarded_correctly_as_a_parameter_to_the_AS_move() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .f))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .six))
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastLeftRightSearch, LastLeftRightSearch(motion: .f, character: "6"))
        XCTAssertEqual(asVisualModeMock.functionCalled, "semicolon(times:lastLeftRightSearch:on:_:)")
        XCTAssertEqual(asVisualModeMock.lastLeftRightSearchParameter, LastLeftRightSearch(motion: .f, character: "6"))
    }
    
    func test_that_it_keeps_Vim_in_VisualMode() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }  
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }

}
