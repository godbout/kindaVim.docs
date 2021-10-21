@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_gI_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .g))
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .I))
    }
    
}


extension SucceedingASNM_gI_Tests {
    
    func test_that_it_calls_the_correct_function_on_AS() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "gI(on:)")
    }
    
    func test_that_it_switches_Vim_into_insert_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .insert)
    }
    
}
