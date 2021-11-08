@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_V__Tests: SucceedingASVM_BaseTests {}


// visualStyle characterwise
extension SucceedingASVM_V__Tests {    

    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .V))
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "VForVisualStyleCharacterwise(on:)")
    }
    
    func test_that_if_Vim_was_in_visual_mode_characterwise_it_switches_into_visual_mode_linewise() {
        kindaVimEngine.visualStyle = .characterwise
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .V))
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
        XCTAssertEqual(kindaVimEngine.visualStyle, .linewise)
    }
    
}


// visualStyle linewise
extension SucceedingASVM_V__Tests {    
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_linewise() {
        kindaVimEngine.visualStyle = .linewise
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .V))
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "VForVisualStyleLinewise(on:)")
    }
    
    func test_that_if_Vim_was_in_visual_mode_linewise_it_switches_into_normal_mode() {
        kindaVimEngine.visualStyle = .linewise
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .V))
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
}
