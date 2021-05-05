//
//  VimEngineControllerTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 05/05/2021.
//

@testable import kindaVim
import XCTest

class VimEngineControllerTests: XCTestCase {

    let keyboardStrategyMock = KeyboardStrategyMock()

    override func setUp() {
        VimEngineController.shared.keyboardStrategy = keyboardStrategyMock
        VimEngineController.shared.accessibilityStrategy = FailingAccessibilityStrategyStub()
        VimEngineController.shared.enterCommandMode()
    }

}

// test calls to keyboard strategy functions
// for VimKeys that are implemented
extension VimEngineControllerTests {

    func test_that_$_calls_the_dollarSign_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .four, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "dollarSign()")
    }

    func test_that___calls_the_underscore_function_on_keyboard_strategy() {
        print("CALLED: " + keyboardStrategyMock.functionCalled)
        let keyCombination = KeyCombination(key: .minus, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "underscore()")
    }

    func test_that_0_calls_the_zero_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .zero)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "zero()")
    }

    func test_that_a_calls_the_a_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .a)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "a()")
    }

    func test_that_A_calls_the_A_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .a, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "A()")
    }

    func test_that_b_calls_the_b_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .b)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "b()")
    }

    func test_that_c_does_not_call_any_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .c)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }

    func test_that_C_calls_the_C_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .c, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "C()")
    }

    func test_that_cc_calls_the_cc_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .c)

        VimEngineController.shared.handle(keyCombination: keyCombination)
        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "cc()")
    }

    func test_that_ci_does_not_call_any_function_on_keyboard_strategy() {
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .i))

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }

    func test_that_ciw_calls_the_ciw_function_on_keyboard_strategy() {
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .i))
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .w))

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "ciw()")
    }

    func test_that_d_does_not_call_any_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .d)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }

    func test_that_dd_calls_the_dd_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .d)

        VimEngineController.shared.handle(keyCombination: keyCombination)
        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "dd()")
    }

    func test_that_g_does_not_call_any_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .g)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }

    func test_that_G_calls_the_G_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .g, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "G()")
    }

    func test_that_gg_calls_the_gg_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .g)

        VimEngineController.shared.handle(keyCombination: keyCombination)
        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "gg()")
    }

    func test_that_h_calls_the_h_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .h)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "h()")
    }

    func test_that_i_does_not_call_any_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .i)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }

    func test_that_I_calls_the_I_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .i, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "I()")
    }

    func test_that_j_calls_the_j_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .j)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "j()")
    }

    func test_that_k_calls_the_k_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .k)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "k()")
    }

    func test_that_l_calls_the_l_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .l)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "l()")
    }

    func test_that_o_calls_the_o_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .o)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "o()")
    }

    func test_that_O_calls_the_O_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .o, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "O()")
    }

    func test_that_control_r_calls_the_controlR_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .r, control: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "controlR()")
    }

    func test_that_u_calls_the_u_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .u)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "u()")
    }

    func test_that_w_calls_the_w_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .w)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "w()")
    }

    func test_that_x_calls_the_x_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .x)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "x()")
    }

    func test_that_X_calls_the_X_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .x, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(keyboardStrategyMock.functionCalled, "X()")
    }

}

// test calls to keyboard strategy functions
// for VimKeys that don't exist, or exist but are not implemented
// this is a non exhaustive list, just to remember this needs to be tested
extension VimEngineControllerTests {

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

}

// test calls to keyboard strategy functions
// for operators commands that don't exist
extension VimEngineControllerTests {

    func test_that_co_do_not_call_any_function_on_keyboard_strategy() {
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .o))
        
        XCTAssertEqual(keyboardStrategyMock.functionCalled, "")
    }

}
