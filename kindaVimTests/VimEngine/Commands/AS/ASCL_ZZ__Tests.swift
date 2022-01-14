@testable import kindaVim
import KeyCombination
import XCTest


class ASCL_ZZ__Tests: ASCL_BaseTests {

    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .Z))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .Z))
    }

}


extension ASCL_ZZ__Tests {
    
    func test_that_it_calles_the_correct_command() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(commandsMock.functionCalled, "ZZ()")
    }
    
    func test_that_it_switches_Vim_to_InsertMode() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
