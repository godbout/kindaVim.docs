@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_G__Tests: SucceedingASVM_BaseTests {
    
    private func applyMove() {
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .G))
    }
    
}


// visualStyle character
extension SucceedingASVM_G__Tests {    
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        KindaVimEngine.shared.visualStyle = .characterwise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "GForVisualStyleCharacterwise(on:)")
    }
    
}


// visualStyle linewise
extension SucceedingASVM_G__Tests {
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_linewise() {
        KindaVimEngine.shared.visualStyle = .linewise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "GForVisualStyleLinewise(on:)")
    }
    
}


// both
extension SucceedingASVM_G__Tests {
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        applyMove()
        
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .visual)
    }
    
}
