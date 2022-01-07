@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_v_Tests: ASVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .v))
    }
}


// visualStyle character
extension SucceedingASVM_v_Tests {    
        
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        kindaVimEngine.state.visualModeStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "vForVisualStyleCharacterwise(on:)")
    }
    
    func test_that_if_Vim_was_in_visual_mode_characterwise_it_switches_into_normal_mode() {
        kindaVimEngine.state.visualModeStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_Vim_as_in_VisualMode_Characterwise_it_resets_the_count() {
        kindaVimEngine.state.visualModeStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}


// visualStyle linewise
extension SucceedingASVM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_linewise() {
        kindaVimEngine.state.visualModeStyle = .linewise
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .v))
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "vForVisualStyleLinewise(on:)")
    }
    
    func test_that_if_Vim_was_in_visual_mode_linewise_it_switches_into_visual_mode_characterwise() {
        kindaVimEngine.state.visualModeStyle = .linewise
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .v))
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.state.visualModeStyle, .characterwise)
    }
    
    func test_that_it_Vim_as_in_VisualMode_Linewise_it_resets_the_count() {
        kindaVimEngine.state.visualModeStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }

}
