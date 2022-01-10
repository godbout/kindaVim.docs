@testable import kindaVim
import KeyCombination
import XCTest


class KSNM_dDollarSign_Tests: KSNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .dollarSign))
    }

}


extension KSNM_dDollarSign_Tests {
    
    func test_that_it_calls_the_correct_function_on_KS() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "dDollarSign(_:)")
    }
    
    func test_that_it_stays_in_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
