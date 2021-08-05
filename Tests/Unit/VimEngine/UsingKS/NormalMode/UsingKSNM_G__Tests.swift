@testable import kindaVim
import XCTest

class UsingKS_G__Tests: UsingKSNM_BaseTests {

    override func setUp() {
        super.setUp()

        KindaVimEngine.shared.handle(keyCombination: KeyCombination(vimKey: .G))
    }

}

extension UsingKS_G__Tests {
    
    func test_that_G_calls_the_G_function_on_keyboard_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "G(on:)")
    }
    
    func test_that_G_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(KindaVimEngine.shared.currentMode, .normal)
    }
    
}


