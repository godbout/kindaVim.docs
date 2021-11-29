@testable import kindaVim
import KeyCombination
import XCTest


class HybridNM_O__Tests: HybridNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .pgR)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .O), appMode: .pgR)
    }
    
}


extension HybridNM_O__Tests {
    
    func test_that_it_does_not_call_the_AS_but_calls_KS_instead() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "")
        XCTAssertEqual(ksNormalModeMock.functionCalled, "O()")
    }
    
    func test_that_it_switches_Vim_into_insert_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
