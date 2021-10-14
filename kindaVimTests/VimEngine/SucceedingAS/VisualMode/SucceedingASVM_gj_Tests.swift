@testable import kindaVim
import KeyCombination
import XCTest


// see NM j for blah blah
class SucceedingASVM_j_Tests: SucceedingASVM_BaseTests {
    
    private func applyMove() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .j))
    }
    
}


// visualStyle character
extension SucceedingASVM_j_Tests {    
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "gjForVisualStyleCharacterwise(on:)")
    }
    
}


// visualStyle linewise
extension SucceedingASVM_j_Tests {
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_linewise() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "gjForVisualStyleLinewise(on:)")
    }
    
}


// both
extension SucceedingASVM_j_Tests {
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        applyMove()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
    }
    
}
