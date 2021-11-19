@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_y_Tests: SucceedingASVM_BaseTests {
    
    private func applyMoveBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .y))
    }
    
}


// visualStyle character
extension SucceedingASVM_y_Tests {    
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyMoveBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "yForVisualStyleCharacterwise(on:_:)")
    }
    
    func test_that_it_switches_Vim_to_NormalMode_when_VisualStyle_is_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyMoveBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }     
        
    func test_that_it_resets_the_count_when_VisualStyle_is_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyMoveBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}


// visualStyle linewise
extension SucceedingASVM_y_Tests {
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyMoveBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "yForVisualStyleLinewise(on:_:)")
    }
       
    func test_that_it_switches_Vim_to_NormalMode_when_VisualStyle_is_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyMoveBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }     
    
    func test_that_it_resets_the_count_when_VisualStyle_is_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyMoveBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
