@testable import kindaVim
import KeyCombination
import XCTest


// two things here:
// 1. yes, there's no .eight applied here before the .zero move, because if there was then we
//    would have a count of 80 rather than the 0 move. 0 should only happen as a Vim move
//    if there is no previous digits in the count buffers.
// 2. there's no test for the count because it's not possible to force a count before a 0
//    being considered as a Vim move. the count should always be nil before a 0, else the 0 would
//    be part of the count rathern than a Vim move. (although in the impl we forcing the
//    count reset, just for precaution.)
class SucceedingASVM_0_Tests: ASVM_BaseTests {
    
    // yes, there's no .eight here before the .zero move, because if there was then we
    // would have a count of 80 rather than the 0 move. 0 should only happen as a Vim move
    // if there is no previous digits in the count buffers.
    private func applyKeyCombinationsBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .zero))
    }
    
}


// visualStyle character
extension SucceedingASVM_0_Tests {    
    
    func test_that_it_calls_the_correct_function_on_ASVM_when_visualStyle_is_characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "zeroForVisualStyleCharacterwise(on:)")
    }
    
    func test_that_it_keeps_Vim_in_VisualMode_when_VisualStyle_is_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }     
    
}


// visualStyle linewise
extension SucceedingASVM_0_Tests {
    
    func test_that_it_does_nothing_because_the_move_does_not_make_sense_on_ASVM_when_visualStyle_is_linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "")
    }
    
    func test_that_it_keeps_Vim_in_VisualMode_when_VisualStyle_is_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .visual)
    }     
    
}
