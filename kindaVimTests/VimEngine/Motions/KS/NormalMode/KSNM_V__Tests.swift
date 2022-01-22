@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_V__Tests: KSNM_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .V))
    }

}


extension KSNM_V__Tests {
    
    func test_that_it_calls_the_correct_function_on_KS() {
        XCTAssertEqual(ksVisualModeMock.functionCalled, "VFromNormalMode(_:)")
    }
    
    func test_that_it_switches_Vim_to_VisualMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
    func test_that_it_sets_the_VisualStyle_to_Linewise() {
        XCTAssertEqual(kindaVimEngine.state.visualStyle, .linewise)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
