@testable import kindaVim
import XCTest

class AllOthers_Tests: BaseTests {
    
    func test_that_key_combinations_that_do_not_exist_do_not_call_any_function_on_keyboard_strategy() {
        let optionA = KeyCombination(key: .a, option: true)
        VimEngineController.shared.handle(keyCombination: optionA)
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")

        let commandB = KeyCombination(key: .b, command: true)
        VimEngineController.shared.handle(keyCombination: commandB)
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")

        let controlShiftC = KeyCombination(key: .c, control: true, shift: true)
        VimEngineController.shared.handle(keyCombination: controlShiftC)
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }

    func test_that_key_combinations_that_exist_but_are_not_implemented_do_not_call_any_function_on_keyboard_strategy() {
        let controlA = KeyCombination(key: .a, control: true)
        VimEngineController.shared.handle(keyCombination: controlA)
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")

        let shiftB = KeyCombination(key: .b, shift: true)
        VimEngineController.shared.handle(keyCombination: shiftB)
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")

        let controlJ = KeyCombination(key: .j, control: true)
        VimEngineController.shared.handle(keyCombination: controlJ)
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }
    
    func test_that_operators_that_do_not_exist_do_not_call_any_function_on_keyboard_strategy() {
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .o))
        
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }
  
    // this needs more thinking
    // diw returns w currently. even if not implemented, shouldn't it return nothing?
//    func test_that_operators_that_exist_but_are_not_implemented_may_call_a_precedent_operator_function_instead() {
//        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .d))
//        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .i))
//        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .w))
//
//        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
//    }

}
