@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_C__Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .C))
    }
    
}


extension SucceedingASNM_C__Tests {
    
    func test_that_in_Auto_Mode_it_calls_the_correct_function_on_AS_with_PGR_off() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "C(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, false)
    }
    
    func test_that_in_PGR_Mode_it_calls_the_correct_function_on_AS_with_PGR_on() {
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight), appMode: .pgR)
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .C), appMode: .pgR)
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "C(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, true)
    }
    
    func test_that_it_switches_Vim_into_insert_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }

}
