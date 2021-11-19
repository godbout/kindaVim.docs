@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_O__Tests: EnforcingKSNM_BaseTests {

    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), enforceKeyboardStrategy: true)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .O), enforceKeyboardStrategy: true)
    }

}


extension EnforcingKS_O__Tests {
    
    func test_that_O_calls_the_O_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "O()")
    }
    
    func test_that_O_switches_Vim_to_insert_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}



