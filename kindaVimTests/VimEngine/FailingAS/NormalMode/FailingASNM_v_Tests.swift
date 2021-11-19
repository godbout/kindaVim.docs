@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_v_Tests: FailingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .v))
    }
    
}


extension FailingASNM_v_Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_there_is_none_needed_for_that_move() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_it_switches_Vim_to_visual_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
    func test_that_it_sets_the_visual_style_to_characterwise() {
        XCTAssertEqual(kindaVimEngine.visualStyle, .characterwise)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
