@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_v_Tests: SucceedingASVM_BaseTests {}


// visualStyle character
extension SucceedingASVM_v_Tests {    
        
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .v))
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "vForVisualStyleCharacterwise(on:)")
    }
    
    func test_that_if_Vim_was_in_visual_mode_characterwise_it_switches_into_normal_mode() {
        kindaVimEngine.visualStyle = .characterwise
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .v))
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
}


// visualStyle linewise
extension SucceedingASVM_v_Tests {
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_linewise() {
        kindaVimEngine.visualStyle = .linewise
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .v))
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "vForVisualStyleLinewise(on:)")
    }
    
    func test_that_if_Vim_was_in_visual_mode_linewise_it_switches_into_visual_mode_characterwise() {
        kindaVimEngine.visualStyle = .linewise
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .v))
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.visualStyle, .characterwise)
    }
    
}
