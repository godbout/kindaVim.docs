@testable import kindaVim
import XCTest

class NotImplementedOrDontExist_Tests: BaseTests {}

// this is for single key combination (not operators)
// single key combination will always fail if they don't exist or ar not implemented
// this is not the case for operators as operators as arrays of Vim Keys
// so the list below is non exhaustive but enough to test
// for the operators (more more below), the list has to be exhaustive
extension NotImplementedOrDontExist_Tests {
    
    func test_that_key_combinations_that_do_not_exist_do_not_call_any_function_on_keyboard_strategy() {
        let optionA = KeyCombination(key: .a, option: true)
        VimEngine.shared.handle(keyCombination: optionA)
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")

        let commandB = KeyCombination(key: .b, command: true)
        VimEngine.shared.handle(keyCombination: commandB)
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")

        let controlShiftC = KeyCombination(key: .c, control: true, shift: true)
        VimEngine.shared.handle(keyCombination: controlShiftC)
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }

    func test_that_key_combinations_that_exist_but_are_not_implemented_do_not_call_any_function_on_keyboard_strategy() {
        let controlA = KeyCombination(key: .a, control: true)
        VimEngine.shared.handle(keyCombination: controlA)
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")

        let shiftB = KeyCombination(key: .b, shift: true)
        VimEngine.shared.handle(keyCombination: shiftB)
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")

        let controlJ = KeyCombination(key: .j, control: true)
        VimEngine.shared.handle(keyCombination: controlJ)
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }
}

// this is for operators
// this is harder to test and to make sure all operators command would be caught
// we would have to test every single one of them
// currently only testing the most common ones
extension NotImplementedOrDontExist_Tests {
    
    func test_that_operators_that_do_not_exist_do_not_call_any_function_on_keyboard_strategy() {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .o))
        
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }

    func test_that_caw_does_not_call_any_function_on_keyboard_strategy() {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .a))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .w))

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }

    func test_that_daw_does_not_call_any_function_on_keyboard_strategy() {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .a))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .w))

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }

    func test_that_diw_does_not_call_any_function_on_keyboard_strategy() {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .w))

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }

}
