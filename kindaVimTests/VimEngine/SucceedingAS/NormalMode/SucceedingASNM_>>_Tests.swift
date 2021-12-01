@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_rightChevronRightChevron_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .rightChevron))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .rightChevron))
    }
    
}


extension SucceedingASNM_rightChevronRightChevron_Tests {
    
    func test_that_in_Auto_Mode_it_calls_the_correct_function_on_AS_with_PGR_off() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "rightChevronRightChevron(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, false)
    }
    
    func test_that_in_PGR_Mode_it_calls_the_correct_function_on_AS_with_PGR_on() {
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .rightChevron))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .rightChevron), appMode: .pgR)
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "rightChevronRightChevron(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, true)
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertEqual(kindaVimEngine.count, 1)
    }
    
}
