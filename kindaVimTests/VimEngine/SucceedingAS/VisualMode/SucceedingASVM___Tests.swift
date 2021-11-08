@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM___Tests: SucceedingASVM_BaseTests {
    
    private func applyMove() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .underscore))
    }
    
}


// visualStyle character
extension SucceedingASVM___Tests {    
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "underscoreForVisualStyleCharacterwise(on:)")
    }
    
}


// visualStyle linewise
extension SucceedingASVM___Tests {
    
    func test_that_it_does_nothing_because_the_move_does_not_make_sense_on_ASVM_when_visualStyle_is_linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyMove()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "")
    }
    
}


// both
extension SucceedingASVM___Tests {
    
    func test_that_it_keeps_Vim_in_visual_mode() {
        applyMove()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }
    
}
