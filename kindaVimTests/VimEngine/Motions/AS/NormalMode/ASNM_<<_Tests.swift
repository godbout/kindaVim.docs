@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_leftChevronLeftChevron_Tests: ASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .leftChevron))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .leftChevron))
    }
    
}


extension SucceedingASNM_leftChevronLeftChevron_Tests {
    
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "leftChevronLeftChevron(on:_:)")
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
