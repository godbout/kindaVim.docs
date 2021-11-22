@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_V__Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .V))
    }
    
}


extension SucceedingASNM_V__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "VForEnteringFromNormalMode(on:)")
    }
    
    func test_that_it_switches_Vim_to_visual_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
    func test_that_it_sets_the_visual_style_to_linewise() {
        XCTAssertEqual(kindaVimEngine.visualStyle, .linewise)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }
   
}
