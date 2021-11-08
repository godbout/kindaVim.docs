@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_c_Tests: SucceedingASVM_BaseTests {
    
    private func applyMove() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
    }
    
}


// visualStyle character
extension SucceedingASVM_c_Tests {    
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "cForVisualStyleCharacterwise(on:)")
    }
    
}


// visualStyle linewise
extension SucceedingASVM_c_Tests {
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "cForVisualStyleLinewise(on:)")
    }
    
}


// both
extension SucceedingASVM_c_Tests {
    
    func test_that_it_switches_Vim_into_InsertMode() {
        applyMove()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
}
