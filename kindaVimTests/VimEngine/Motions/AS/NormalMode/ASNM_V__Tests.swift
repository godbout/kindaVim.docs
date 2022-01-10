@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_V__Tests: ASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .V))
    }
    
}


extension SucceedingASNM_V__Tests {
    
    func test_that_it_calls_the_correct_function_on_AS() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "VFromNormalMode(on:)")
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
