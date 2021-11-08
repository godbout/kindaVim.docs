@testable import kindaVim
import KeyCombination
import XCTest


class EnforcingKS_NotImplementedOrDontExist_Tests: EnforcingKSNM_BaseTests {}


// this is for single key combination (not operators)
// single key combination will always fail if they don't exist or ar not implemented
// this is not the case for operators as operators as arrays of Vim Keys
// so the list below is non exhaustive but enough to test
// for the operators (more more below), the list has to be exhaustive
extension EnforcingKS_NotImplementedOrDontExist_Tests {
    
    func test_that_key_combinations_that_do_not_exist_do_not_call_any_function_on_keyboard_strategy() {
        let optionA = KeyCombination(key: .a, option: true)
        kindaVimEngine.handle(keyCombination: optionA)
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")

        let commandB = KeyCombination(key: .b, command: true)
        kindaVimEngine.handle(keyCombination: commandB)
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")

        let controlShiftC = KeyCombination(key: .c, control: true, shift: true)
        kindaVimEngine.handle(keyCombination: controlShiftC)
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }

    func test_that_key_combinations_that_exist_but_are_not_implemented_do_not_call_any_function_on_keyboard_strategy() {
        let controlA = KeyCombination(key: .a, control: true)
        kindaVimEngine.handle(keyCombination: controlA)
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")

        let commandB = KeyCombination(key: .b, command: true)
        kindaVimEngine.handle(keyCombination: commandB)
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")

        let controlJ = KeyCombination(key: .j, control: true)
        kindaVimEngine.handle(keyCombination: controlJ)
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }
}


// this is for operators
// this is harder to test and to make sure all operators command would be caught
// we would have to test every single one of them
// currently only testing the most common ones
extension EnforcingKS_NotImplementedOrDontExist_Tests {
    
    func test_that_operators_that_do_not_exist_do_not_call_any_function_on_keyboard_strategy() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .o))
        
        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }

    func test_that_caw_does_not_call_any_function_on_keyboard_strategy() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))

        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }

    func test_that_daw_does_not_call_any_function_on_keyboard_strategy() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))

        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }

    func test_that_diw_does_not_call_any_function_on_keyboard_strategy() {
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .i))
        kindaVimEngine.handle(keyCombination: KeyCombination(key: .w))

        XCTAssertEqual(ksNormalModeMock.functionCalled, "")
    }

}
