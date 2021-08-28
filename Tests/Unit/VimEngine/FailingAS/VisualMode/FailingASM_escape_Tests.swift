@testable import kindaVim
import KeyCombination
import XCTest


class FailingASVM_escape_Tests: FailingASVM_BaseTests {
    
    func test_that_it_currently_calls_nothing() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .escape))
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "")
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
