//
//  VimEngineControllerTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 05/05/2021.
//

@testable import kindaVim
import XCTest

class VimEngineControllerTests: XCTestCase {

    static let keyboardStrategyMock = KeyboardStrategyMock()

    override class func setUp() {
        VimEngineController.shared.keyboardStrategy = keyboardStrategyMock
        VimEngineController.shared.accessibilityStrategy = AccessibilityStrategyStub()
    }

    override func setUp() {
        VimEngineController.shared.enterCommandMode()
    }

}

// using the Keyboard Strategy
extension VimEngineControllerTests {

    func test_that_$_calls_the_dollarSign_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .four, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "dollarSign()")
    }

    func test_that___calls_the_underscore_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .minus, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "underscore()")
    }

    func test_that_0_calls_the_zero_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .zero)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "zero()")
    }

    func test_that_a_calls_the_a_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .a)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "a()")
    }

    func test_that_A_calls_the_A_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .a, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "A()")
    }

    func test_that_b_calls_the_b_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .b)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "b()")
    }

    func test_that_c_does_not_call_any_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .c)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "")
    }

    func test_that_C_calls_the_C_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .c, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "C()")
    }

    func test_that_cc_calls_the_cc_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .c)

        VimEngineController.shared.handle(keyCombination: keyCombination)
        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "cc()")
    }

    func test_that_ci_does_not_call_any_function_on_keyboard_strategy() {
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .i))

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "")
    }

    func test_that_ciw_calls_the_ciw_function_on_keyboard_strategy() {
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .c))
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .i))
        VimEngineController.shared.handle(keyCombination: KeyCombination(key: .w))

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "ciw()")
    }

    func test_that_d_does_not_call_any_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .d)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "")
    }

    func test_that_dd_calls_the_dd_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .d)

        VimEngineController.shared.handle(keyCombination: keyCombination)
        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "dd()")
    }

    func test_that_g_does_not_call_any_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .g)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "")
    }

    func test_that_G_calls_the_G_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .g, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "G()")
    }

    func test_that_gg_calls_the_gg_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .g)

        VimEngineController.shared.handle(keyCombination: keyCombination)
        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "gg()")
    }

    func test_that_h_calls_the_h_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .h)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "h()")
    }

    func test_that_i_does_not_call_any_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .i)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "")
    }

    func test_that_I_calls_the_I_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .i, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "I()")
    }

    func test_that_j_calls_the_j_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .j)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "j()")
    }

    func test_that_k_calls_the_k_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .k)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "k()")
    }

    func test_that_l_calls_the_l_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .l)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "l()")
    }

    func test_that_o_calls_the_o_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .o)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "o()")
    }

    func test_that_O_calls_the_O_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .o, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "O()")
    }

    func test_that_control_r_calls_the_controlR_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .r, control: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "controlR()")
    }

    func test_that_u_calls_the_u_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .u)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "u()")
    }

    func test_that_w_calls_the_w_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .w)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "w()")
    }

    func test_that_x_calls_the_x_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .x)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "x()")
    }

    func test_that_X_calls_the_X_function_on_keyboard_strategy() {
        let keyCombination = KeyCombination(key: .x, shift: true)

        VimEngineController.shared.handle(keyCombination: keyCombination)

        XCTAssertEqual(Self.keyboardStrategyMock.functionLastCalled, "X()")
    }

}
