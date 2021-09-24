@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_leftChevronLeftChevron_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .leftChevron))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .leftChevron))
    }
    
}


extension SucceedingASNM_leftChevronLeftChevron_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "leftChevronLeftChevron(on:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
