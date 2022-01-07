@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_gk_Tests: ASVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .k))
    }
    
}


// visualStyle character
extension SucceedingASVM_gk_Tests {    
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        kindaVimEngine.state.visualModeStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "gkForVisualStyleCharacterwise(on:)")
    }
    
    func test_that_it_keeps_Vim_in_VisualMode_when_VisualStyle_is_Characterwise() {
        kindaVimEngine.state.visualModeStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }     
        
    func test_that_it_resets_the_count_when_VisualStyle_is_Characterwise() {
        kindaVimEngine.state.visualModeStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}


// visualStyle linewise
extension SucceedingASVM_gk_Tests {
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_linewise() {
        kindaVimEngine.state.visualModeStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "gkForVisualStyleLinewise(on:)")
    }
       
    func test_that_it_keeps_Vim_in_VisualMode_when_VisualStyle_is_Linewise() {
        kindaVimEngine.state.visualModeStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }     
    
    func test_that_it_resets_the_count_when_VisualStyle_is_Linewise() {
        kindaVimEngine.state.visualModeStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
