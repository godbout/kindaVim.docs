@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_y_Tests: SucceedingASVM_BaseTests {
    
    private func applyMove() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .y))
    }
    
}


// visualStyle character
extension SucceedingASVM_y_Tests {    
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "yForVisualStyleCharacterwise(on:_:)")
    }
    
}


// visualStyle linewise
extension SucceedingASVM_y_Tests {
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "yForVisualStyleLinewise(on:_:)")
    }
    
}


// both
extension SucceedingASVM_y_Tests {
    
    func test_that_it_switches_Vim_to_Normal_Mode() {
        applyMove()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
}
