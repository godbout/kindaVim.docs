@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_v_Tests: KSNM_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .v))
    }

}


extension KSNM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_AS() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "vFromNormalMode()")
    }
        
    func test_that_it_switches_Vim_to_VisualMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
    func test_that_it_sets_the_VisualStyle_to_Characterwise() {
        XCTAssertEqual(kindaVimEngine.state.visualStyle, .characterwise)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
