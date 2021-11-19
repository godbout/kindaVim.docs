@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_escape_Tests: FailingASVM_BaseTests {
    
    private func applyMoveBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .escape))
    }
        
}


// Both
extension FailingASVM_escape_Tests {
    
    func test_that_it_currently_calls_nothing() {
        applyMoveBeingTested()
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "")
    }
    
    func test_that_if_Vim_was_in_visual_mode_linewise_it_switches_into_insert_mode() {
        applyMoveBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
        
}
