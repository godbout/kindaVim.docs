@testable import kindaVim
import XCTest


// currently VM escape has been changed. it goes back to IM without
// remove the selection. this is so that we can comment and indent multiple lines :D
class UsingASVM_escape_Tests: UsingASVM_BaseTests {
    
    func test_that_it_currently_calls_nothing() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "")
    }
    
    func test_that_if_Vim_was_in_visual_mode_characterwise_it_switches_into_insert_mode() {
        KindaVimEngine.shared.visualStyle = .characterwise
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }
    
    func test_that_if_Vim_was_in_visual_mode_linewise_it_switches_into_insert_mode() {
        KindaVimEngine.shared.visualStyle = .linewise
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }
    
}
