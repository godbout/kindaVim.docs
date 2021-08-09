@testable import kindaVim
import XCTest

class UsingASNM_cG_Tests: UsingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .G))
    }
    
}

extension UsingASNM_cG_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "cG(on:)")
    }
    
    func test_that_it_switches_Vim_into_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }
    
}
