@testable import kindaVim
import KeyCombination
import XCTest


// currently VM escape has been changed. it goes back to IM without
// remove the selection. this is so that we can comment and indent multiple lines :D
class SucceedingASVM_escape_Tests: SucceedingASVM_BaseTests {
    
    func test_that_it_currently_calls_nothing() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .escape))
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "")
    }
    
    func test_that_if_Vim_was_in_visual_mode_characterwise_it_switches_into_insert_mode() {
        kindaVimEngine.visualStyle = .characterwise
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .escape))
        
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_if_Vim_was_in_visual_mode_linewise_it_switches_into_insert_mode() {
        kindaVimEngine.visualStyle = .linewise
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .escape))
        
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
}
