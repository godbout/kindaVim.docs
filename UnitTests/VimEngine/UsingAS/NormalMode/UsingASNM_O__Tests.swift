@testable import kindaVim
import XCTest


class UsingASNM_O__Tests: UsingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        VimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .O))
    }
    
}


extension UsingASNM_O__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "O(on:)")
    }
    
    func test_that_it_switches_Vim_into_insert_mode() {
        XCTAssertEqual(VimEngine.shared.currentMode, .insert)
    }
    
}
