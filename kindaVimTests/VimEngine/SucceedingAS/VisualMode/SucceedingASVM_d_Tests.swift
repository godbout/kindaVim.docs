@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_d_Tests: SucceedingASVM_BaseTests {
    
    private func applyMove() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .d))
    }
    
}


// visualStyle character
extension SucceedingASVM_d_Tests {    
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "dForVisualStyleCharacterwise(on:)")
    }
    
}


// visualStyle linewise
extension SucceedingASVM_d_Tests {
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_linewise() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "dForVisualStyleLinewise(on:)")
    }
    
}


// both
extension SucceedingASVM_d_Tests {
    
    func test_that_it_switches_Vim_to_Normal_Mode() {
        applyMove()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
