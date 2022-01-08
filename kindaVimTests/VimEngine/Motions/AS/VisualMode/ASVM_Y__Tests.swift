@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_Y__Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .Y))
    }
    
}


extension SucceedingASVM_Y__Tests {
    
    func test_that_it_calls_the_correct_function_on_ASVM() {
        XCTAssertEqual(asVisualModeMock.functionCalled, "Y(on:_:)")
    }
    
    func test_that_it_switches_Vim_into_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
