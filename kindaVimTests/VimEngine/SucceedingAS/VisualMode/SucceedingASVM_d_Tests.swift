@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASVM_d_Tests: SucceedingASVM_BaseTests {
    
    private func applyKeyCombinationsBeingTested(appMode: AppMode = .auto) {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d), appMode: appMode)
    }
    
}


// visualStyle character
extension SucceedingASVM_d_Tests {    
    
    func test_that_in_Auto_Mode_it_calls_the_correct_function_on_AS_with_PGR_off_when_visualStyle_is_characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "dForVisualStyleCharacterwise(on:pgR:)")
        XCTAssertEqual(asVisualModeMock.pgRPassed, false)
    }
    
    func test_that_in_PGR_Mode_it_calls_the_correct_function_on_AS_with_PGR_on_when_VisualStyle_is_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested(appMode: .pgR)
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "dForVisualStyleCharacterwise(on:pgR:)")
        XCTAssertEqual(asVisualModeMock.pgRPassed, true)
    }
       
    func test_that_it_switches_Vim_to_NormalMode_when_VisualStyle_is_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count_when_VisualStyle_is_Characterwise() {
        kindaVimEngine.visualStyle = .characterwise
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }
    
}


// visualStyle linewise
extension SucceedingASVM_d_Tests {
    
    func test_that_in_Auto_Mode_it_calls_the_correct_function_on_AS_with_PGR_off_when_visualStyle_is_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "dForVisualStyleLinewise(on:pgR:)")
        XCTAssertEqual(asVisualModeMock.pgRPassed, false)
    }
    
    func test_that_in_PGR_Mode_it_calls_the_correct_function_on_AS_with_PGR_on_when_VisualStyle_is_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested(appMode: .pgR)
        
        XCTAssertEqual(asVisualModeMock.functionCalled, "dForVisualStyleLinewise(on:pgR:)")
        XCTAssertEqual(asVisualModeMock.pgRPassed, true)
    }
    
    func test_that_it_switches_Vim_to_NormalMode_when_VisualStyle_is_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
        
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count_when_VisualStyle_is_Linewise() {
        kindaVimEngine.visualStyle = .linewise
        applyKeyCombinationsBeingTested()
                
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
