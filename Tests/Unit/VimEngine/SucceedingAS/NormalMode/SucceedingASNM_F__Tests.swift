@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_F__Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .F))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .a))
    }
    
}


extension SucceedingASNM_F__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "F(to:on:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
