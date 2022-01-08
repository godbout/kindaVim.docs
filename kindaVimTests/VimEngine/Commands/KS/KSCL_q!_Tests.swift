@testable import kindaVim
import KeyCombination
import XCTest


class KSCL_qExclamationMark_Tests: KSCL_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .colon))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .q))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .exclamationMark))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .return), appMode: .keyMapping)
    }

}


extension KSCL_qExclamationMark_Tests {
    
    func test_that_it_calles_the_correct_command() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(commandsMock.functionCalled, "qExclamationMark()")
    }
    
    func test_that_it_switches_Vim_to_InsertMode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.state.currentMode, .insert)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
