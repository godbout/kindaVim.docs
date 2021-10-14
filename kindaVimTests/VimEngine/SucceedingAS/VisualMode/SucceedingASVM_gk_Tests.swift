@testable import kindaVim
import KeyCombination
import XCTest


// see NM j for blah blah
class SucceedingASVM_k_Tests: SucceedingASVM_BaseTests {
    
    private func applyMove() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .k))
    }
    
}


// visualStyle character
extension SucceedingASVM_k_Tests {    
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "gkForVisualStyleCharacterwise(on:)")
    }
    
}


// visualStyle linewise
extension SucceedingASVM_k_Tests {
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_linewise() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "gkForVisualStyleLinewise(on:)")
    }
    
}


// both
extension SucceedingASVM_k_Tests {
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        applyMove()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
    }
    
}
