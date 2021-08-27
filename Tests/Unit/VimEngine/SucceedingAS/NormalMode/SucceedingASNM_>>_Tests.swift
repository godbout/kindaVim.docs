@testable import kindaVim
import XCTest


class SucceedingASNM_rightChevronRightChevron_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .rightChevron))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .rightChevron))
    }
    
}


extension SucceedingASNM_rightChevronRightChevron_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "rightChevronRightChevron(on:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
