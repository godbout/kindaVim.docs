@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_gj_Tests: KSVM_BaseTests {
    
    override func setUp() {
super.setUp()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .j))
    }

}


// VisualStyle Characterwise
extension KSVM_gj_Tests {

    func test_that_it_calls_the_correct_function_on_KS() {
        kindaVimEngine.state.visualStyle = .characterwise
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "gjForVisualStyleCharacterwise()")
    }
    
    func test_that_it_keeps_Vim_in_visual_mode_when_in_VisualStyle_Characterwise() {
        kindaVimEngine.state.visualStyle = .characterwise
        
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
    func test_that_it_resets_the_count() {
        kindaVimEngine.state.visualStyle = .characterwise
        
        
        XCTAssertNil(kindaVimEngine.count)
    }

}


// VisualStyle Linewise
extension KSVM_gj_Tests {

    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Linewise() {
        kindaVimEngine.state.visualStyle = .linewise
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "gjForVisualStyleLinewise()")
    }
    
    func test_that_it_keeps_Vim_in_VisualMode_when_VisualStyle_is_Linewise() {
        kindaVimEngine.state.visualStyle = .linewise
        
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }     
    
    func test_that_it_resets_the_count_when_VisualStyle_is_Linewise() {
        kindaVimEngine.state.visualStyle = .linewise
        
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
