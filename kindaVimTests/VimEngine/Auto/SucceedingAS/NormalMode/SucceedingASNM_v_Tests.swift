@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_v_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .v))
    }
    
}


extension SucceedingASNM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "vForEnteringFromNormalMode(on:)")
    }
        
    func test_that_it_switches_Vim_to_visual_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
    func test_that_it_sets_the_visual_style_to_characterwise() {
        XCTAssertEqual(kindaVimEngine.visualStyle, .characterwise)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
