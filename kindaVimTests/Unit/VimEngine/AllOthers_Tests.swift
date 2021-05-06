@testable import kindaVim
import XCTest

// TODO: read below lol
// for now it just gives some idea
// but for sure it's currently not testing ALL other combinations possible
// should we? sounds kinda crazy to test all
// the moves or operators that haven't been implemented yet
// i think for moves it should be quite ok, if they don't exist we return nil
// but for operators it's harder as the switch is based on strings rather than
// enums
class AllOthers_Tests: BaseTests {
    
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
    
    func test_that_operators_that_do_not_exist_do_not_call_any_function_on_keyboard_strategy() {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .o))
        
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }
  
    func test_that_operators_that_exist_but_are_not_implemented_may_call_a_precedent_operator_function_instead() {
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .d))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .i))
        VimEngine.shared.handle(keyCombination: KeyCombination(key: .w))

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }

}
