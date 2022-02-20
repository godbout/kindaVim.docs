@testable import kindaVim
import KeyCombination
import XCTest
import Common


class KSNM_N__Tests: KSNM_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .N))
    }
    
}


extension KSNM_N__Tests {
    
    func test_that_if_there_is_no_lastSearchCommand_it_does_not_call_the_KS_move() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.lastSearchCommand)
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
        
    func test_that_if_there_is_a_lastSearchCommand_then_it_is_forwarded_correctly_as_a_parameter_to_the_KS_move() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .slash))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .m))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .return))
        
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.lastSearchCommand, LastSearchCommand(motion: .slash, searchString: "ama"))
        XCTAssertEqual(ksNormalModeMock.functionCalled, "N(times:lastSearchCommand:)")
        XCTAssertEqual(ksNormalModeMock.lastSearchCommandParameter, LastSearchCommand(motion: .slash, searchString: "ama"))
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
