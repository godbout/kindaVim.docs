@testable import kindaVim
import XCTest


class UsingASNM_dT__Tests: UsingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .T))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .f))        
    }
    
}


extension UsingASNM_dT__Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "dT(to:on:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}
