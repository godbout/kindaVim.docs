@testable import kindaVim
import KeyCombination
import XCTest


// currently VM escape has been changed. it goes back to IM without
// remove the selection. this is so that we can comment and indent multiple lines :D
class SucceedingASVM_escape_Tests: ASVM_BaseTests {
    
    func test_that_it_currently_calls_nothing() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .escape))
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "")
    }
    
    func test_that_if_Vim_was_in_visual_mode_characterwise_it_switches_into_insert_mode() {
        kindaVimEngine.state.visualModeStyle = .characterwise
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .escape))
        
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_if_Vim_was_in_visual_mode_characterwise_it_resets_the_count() {
        kindaVimEngine.state.visualModeStyle = .characterwise
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .escape))
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
    func test_that_if_Vim_was_in_visual_mode_linewise_it_switches_into_insert_mode() {
        kindaVimEngine.state.visualModeStyle = .linewise
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .escape))
        
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_if_Vim_was_in_visual_mode_linewise_it_resets_the_count() {
        kindaVimEngine.state.visualModeStyle = .linewise
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .escape))
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
