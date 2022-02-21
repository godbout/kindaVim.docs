@testable import kindaVim
import KeyCombination
import XCTest


// see AS ? for blah blah
class KSNM_interrogationMark_Escape_Tests: KSNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .interrogationMark))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .six))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .escape))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))
    }
    
}


extension KSNM_interrogationMark_Escape_Tests {
    
    func test_that_it_calls_the_correct_function_on_accessibility_strategy() {
        XCTAssertEqual(ksNormalModeMock.functionCalled, "w(_:)")
    }
    
    func test_that_it_keeps_Vim_in_NormalMode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }

}
