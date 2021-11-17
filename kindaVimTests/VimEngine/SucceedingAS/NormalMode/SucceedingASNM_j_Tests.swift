@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_j_Tests: SucceedingASNM_BaseTests {
    
    private func applyMoveBeingTested() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .j))
    }
    
}


extension SucceedingASNM_j_Tests {
    
    func test_that_if_it_is_not_remap_it_calls_j_on_AS() {
        kindaVimEngine.jkMapping = false
        applyMoveBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "j(on:)")
    }
        
    func test_that_if_it_is_remapped_it_calls_gj_on_AS() {
        kindaVimEngine.jkMapping = true
        applyMoveBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "gj(on:)")
    }

}


// both
extension SucceedingASNM_j_Tests {
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        applyMoveBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        applyMoveBeingTested()
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
