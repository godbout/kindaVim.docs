@testable import kindaVim
import KeyCombination
import XCTest
import Common


class KSNM_n_Tests: KSNM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .n))
    }
    
}


extension KSNM_n_Tests {
    
    func test_that_if_there_is_no_lastSearchCommand_it_does_not_call_the_KS_move() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.lastSearchCommand)
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
        
    func test_that_if_there_is_a_lastSearchCommand_then_it_is_forwarded_correctly_as_a_parameter_to_the_KS_move() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .interrogationMark))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .h))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .o))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastSearchCommand, LastSearchCommand(motion: .interrogationMark, searchString: "ho"))
        XCTAssertEqual(ksNormalModeMock.functionCalled, "n(times:lastSearchCommand:)")
        XCTAssertEqual(ksNormalModeMock.lastSearchCommandParameter, LastSearchCommand(motion: .interrogationMark, searchString: "ho"))
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
