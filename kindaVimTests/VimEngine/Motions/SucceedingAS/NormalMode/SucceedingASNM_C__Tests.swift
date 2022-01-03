@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_C__Tests: SucceedingASNM_BaseTests {
    
    private func applyKeyCombinationsBeingTested(pgR: Bool = false) {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .C), appMode: pgR == true ? .pgR : .auto)
    }
    
}


extension SucceedingASNM_C__Tests {
    
    // TODO: all those tests can now be set as a single test that check that we set
    // the correct pgR value in &state
//    func test_that_in_Auto_Mode_it_calls_the_correct_function_on_AS_with_PGR_off() {
//        applyKeyCombinationsBeingTested()
//               
//        XCTAssertEqual(asNormalModeMock.functionCalled, "C(on:pgR:)")
//        XCTAssertEqual(asNormalModeMock.pgRPassed, false)
//    }
    
    func test_that_it_calls_the_correct_function_on_the_AccessibilityStrategy() {
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "C(on:_:)")
    }
    
    func test_that_it_switches_Vim_into_InsertMode() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertEqual(kindaVimEngine.currentMode, .insert)
    }

    // TODO: that one can't work anymore here because we use a mock.
    // and it's now tested in AS. so they can all be removed :D
//    func test_that_it_sets_the_LastYankStyle_to_Characterwise() {
//        kindaVimEngine.state.lastYankStyle = .linewise
//        applyKeyCombinationsBeingTested()
//                
//        XCTAssertEqual(kindaVimEngine.state.lastYankStyle, .characterwise)
//    }
    
    func test_that_it_resets_the_count() {
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }

}
