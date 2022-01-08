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
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .zero))
    }
    
}


extension SucceedingASVM_0_Tests {    
    
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "zero(on:_:)")
    }
    
    func test_that_it_keeps_Vim_in_VisualMode() {
        XCTAssertEqual(kindaVimEngine.state.currentMode, .visual)
    }     
    
}
