@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_dl_Tests: SucceedingASNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested(pgR: Bool = false) {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .l), appMode: pgR == true ? .pgR : .auto)
    }
    
}


extension SucceedingASNM_dl_Tests {
    
    func test_that_in_Auto_Mode_it_calls_the_correct_function_on_AS_with_PGR_off() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(asNormalModeMock.functionCalled, "dl(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, false)
    }
    
    func test_that_in_PGR_Mode_it_calls_the_correct_function_on_AS_with_PGR_on() {
        applyKeyCombinationsBeingTested(pgR: true)
                
        XCTAssertEqual(asNormalModeMock.functionCalled, "dl(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, true)
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_sets_the_LastYankStyle_to_Characterwise() {
        kindaVimEngine.lastYankStyle = .linewise
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.lastYankStyle, .characterwise)
    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
               
        XCTAssertNil(kindaVimEngine.count)
    }

}
