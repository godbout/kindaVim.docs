@testable import kindaVim
import KeyCombination
import XCTest


class KSVM_gg_Tests: KSVM_BaseTests {
    
    override func setUp() {
super.setUp()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .g))
    }

}


// VisualStyle Characterwise
extension KSVM_gg_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Characterwise() {
        
        

        XCTAssertEqual(ksVisualModeMock.functionCalled, "ggForNonTextElement()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_VisualStyle_Characterwise() {
        
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "ggForTextElementWhenInVisualStyleCharacterwise()")
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
extension KSVM_gg_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS_when_in_VisualStyle_Linewise() {
        

        XCTAssertEqual(ksVisualModeMock.functionCalled, "ggForNonTextElement()")
    }
    
    func test_that_it_calls_the_relevant_KS_function_for_TextElements_as_a_fallback_when_in_VisualStyle_Linewise() {
        
        
        XCTAssertEqual(ksVisualModeMock.functionCalled, "ggForTextElementWhenInVisualStyleLinewise()")
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
