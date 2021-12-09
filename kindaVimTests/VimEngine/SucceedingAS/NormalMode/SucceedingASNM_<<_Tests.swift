@testable import kindaVim
import KeyCombination
import XCTest


class SucceedingASNM_leftChevronLeftChevron_Tests: SucceedingASNM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .leftChevron))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .leftChevron))
    }
    
}


extension SucceedingASNM_leftChevronLeftChevron_Tests {
    
    func test_that_in_Auto_Mode_it_calls_the_correct_function_on_AS_with_PGR_off() {
        XCTAssertEqual(asNormalModeMock.functionCalled, "leftChevronLeftChevron(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, false)
    }
    
    func test_that_in_PGR_Mode_it_calls_the_correct_function_on_AS_with_PGR_on() {
        kindaVimEngine.enterNormalMode()
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .leftChevron))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .leftChevron), appMode: .pgR)
        
        XCTAssertEqual(asNormalModeMock.functionCalled, "leftChevronLeftChevron(on:pgR:)")
        XCTAssertEqual(asNormalModeMock.pgRPassed, true)
    }
    
    func test_that_it_keeps_Vim_in_normal_mode() {
        XCTAssertEqual(kindaVimEngine.currentMode, .normal)
    }
    
    func test_that_it_resets_the_count() {
        XCTAssertNil(kindaVimEngine.count)
    }
    
}
