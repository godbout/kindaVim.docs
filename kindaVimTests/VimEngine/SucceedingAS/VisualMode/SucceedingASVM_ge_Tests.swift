@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_ge_Tests: SucceedingASVM_BaseTests {
    
    private func applyMoveBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .g))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .e))
    }
    
}


// visualStyle character
extension SucceedingASVM_ge_Tests {
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyMoveBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "geForVisualStyleCharacterwise(on:)")
    }
    
}


// visualStyle linewise
extension SucceedingASVM_ge_Tests {
    
    func test_that_it_does_nothing_because_the_move_does_not_make_sense_on_ASVM_when_visualStyle_is_linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyMoveBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "")
    }
    
}


// both
extension SucceedingASVM_ge_Tests {
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        applyMoveBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}