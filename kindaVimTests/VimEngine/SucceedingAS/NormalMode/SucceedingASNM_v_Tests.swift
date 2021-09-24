@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_v_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .v))
    }
    
}


extension SucceedingASNM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "vForEnteringFromNormalMode(on:)")
    }
        
    func test_that_it_switches_Vim_to_visual_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
    }
    
    func test_that_it_sets_the_visual_style_to_characterwise() {
        XCTAssertEqual(KindaVimEngine.shared.visualStyle, .characterwise)
    }
        
}
