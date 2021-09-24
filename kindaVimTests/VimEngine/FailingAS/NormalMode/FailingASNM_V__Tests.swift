@testable import kindaVim
import KeyCombination
import XCTest


class FailingASNM_V__Tests: FailingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .V))
    }
    
}


extension FailingASNM_V__Tests {
    
    func test_that_it_does_not_calls_any_KS_function_because_there_is_none_needed_for_that_move() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
    
    func test_that_it_switches_Vim_to_visual_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
    }
    
    func test_that_it_sets_the_visual_style_to_characterwise() {
        XCTAssertEqual(KindaVimEngine.shared.visualStyle, .linewise)
    }
    
}
