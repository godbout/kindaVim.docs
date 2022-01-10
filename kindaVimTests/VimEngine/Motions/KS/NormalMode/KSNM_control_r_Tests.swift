@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_control_r_Tests: KSNM_BaseTests {

    override func setUp() {
super.setUp()

        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .r, control: true))
    }

}


extension KSNM_control_r_Tests {
    
    func test_that_control_r_calls_the_controlR_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "controlR()")
    }
    
    func test_that_control_r_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
        
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
