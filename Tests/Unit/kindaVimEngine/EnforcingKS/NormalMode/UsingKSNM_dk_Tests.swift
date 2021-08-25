@testable import kindaVim
import XCTest

class UsingKS_dk_Tests: UsingKSNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .d), enforceKeyboardStrategy: true)
        KindaVimEngine.shared.handle(keyCombination: KeyCombination(key: .k), enforceKeyboardStrategy: true)
    }
    
}

extension UsingKS_dk_Tests {
    
    func test_that_dk_calls_the_dk_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dk(on:)")
    }
    
    func test_that_dk_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}

