//
//  VimKeyTests.swift
//  kindaVimTests
//
//  Created by Guillaume Leclerc on 03/05/2021.
//

@testable import kindaVim
import XCTest

class KeyCombinationTests: XCTestCase {}

// test VimKeys that are implemented
extension KeyCombinationTests {

    func test_that_$_has_a_VimKey_equivalent_of_dollarSign() {
        let keyCombination = KeyCombination(key: .four, shift: true)

        XCTAssertEqual(keyCombination.vimKey, VimKey.dollarSign)
    }

    func test_that___has_a_VimKey_equivalent_of_underscore() {
        let keyCombination = KeyCombination(key: .minus, shift: true)

        XCTAssertEqual(keyCombination.vimKey, VimKey.underscore)
    }

    func test_that_0_has_a_VimKey_equivalent_of_zero() {
        let keyCombination = KeyCombination(key: .zero)

        XCTAssertEqual(keyCombination.vimKey, VimKey.zero)
    }

    func test_that_a_has_a_VimKey_equivalent_of_a() {
        let keyCombination = KeyCombination(key: .a)

        XCTAssertEqual(keyCombination.vimKey, VimKey.a)
    }

    func test_that_shift_a_has_a_VimKey_equivalent_of_A() {
        let keyCombination = KeyCombination(key: .a, shift: true)

        XCTAssertEqual(keyCombination.vimKey, VimKey.A)
    }

    func test_that_b_has_a_VimKey_equivalent_of_b() {
        let keyCombination = KeyCombination(key: .b)

        XCTAssertEqual(keyCombination.vimKey, VimKey.b)
    }

    func test_that_c_has_a_VimKey_equivalent_of_c() {
        let keyCombination = KeyCombination(key: .c)

        XCTAssertEqual(keyCombination.vimKey, VimKey.c)
    }

    func test_that_C_has_a_VimKey_equivalent_of_C() {
        let keyCombination = KeyCombination(key: .c, shift: true)

        XCTAssertEqual(keyCombination.vimKey, VimKey.C)
    }

    func test_that_d_has_a_VimKey_equivalent_of_d() {
        let keyCombination = KeyCombination(key: .d)

        XCTAssertEqual(keyCombination.vimKey, VimKey.d)
    }

    func test_that_g_has_a_VimKey_equivalent_of_g() {
        let keyCombination = KeyCombination(key: .g)

        XCTAssertEqual(keyCombination.vimKey, VimKey.g)
    }

    func test_that_G_has_a_VimKey_equivalent_of_G() {
        let keyCombination = KeyCombination(key: .g, shift: true)

        XCTAssertEqual(keyCombination.vimKey, VimKey.G)
    }

    func test_that_h_has_a_VimKey_equivalent_of_h() {
        let keyCombination = KeyCombination(key: .h)

        XCTAssertEqual(keyCombination.vimKey, VimKey.h)
    }

    func test_that_i_has_a_VimKey_equivalent_of_i() {
        let keyCombination = KeyCombination(key: .i)

        XCTAssertEqual(keyCombination.vimKey, VimKey.i)
    }

    func test_that_I_has_a_VimKey_equivalent_of_I() {
        let keyCombination = KeyCombination(key: .i, shift: true)

        XCTAssertEqual(keyCombination.vimKey, VimKey.I)
    }

    func test_that_j_has_a_VimKey_equivalent_of_j() {
        let keyCombination = KeyCombination(key: .j)

        XCTAssertEqual(keyCombination.vimKey, VimKey.j)
    }

    func test_that_k_has_a_VimKey_equivalent_of_k() {
        let keyCombination = KeyCombination(key: .k)

        XCTAssertEqual(keyCombination.vimKey, VimKey.k)
    }

    func test_that_l_has_a_VimKey_equivalent_of_l() {
        let keyCombination = KeyCombination(key: .l)

        XCTAssertEqual(keyCombination.vimKey, VimKey.l)
    }

    func test_that_o_has_a_VimKey_equivalent_of_o() {
        let keyCombination = KeyCombination(key: .o)

        XCTAssertEqual(keyCombination.vimKey, VimKey.o)
    }

    func test_that_O_has_a_VimKey_equivalent_of_O() {
        let keyCombination = KeyCombination(key: .o, shift: true)

        XCTAssertEqual(keyCombination.vimKey, VimKey.O)
    }

    func test_that_control_r_has_a_VimKey_equivalent_of_controlR() {
        let keyCombination = KeyCombination(key: .r, control: true)

        XCTAssertEqual(keyCombination.vimKey, VimKey.controlR)
    }

    func test_that_u_has_a_VimKey_equivalent_of_u() {
        let keyCombination = KeyCombination(key: .u)

        XCTAssertEqual(keyCombination.vimKey, VimKey.u)
    }

    func test_that_w_has_a_VimKey_equivalent_of_w() {
        let keyCombination = KeyCombination(key: .w)

        XCTAssertEqual(keyCombination.vimKey, VimKey.w)
    }

    func test_that_x_has_a_VimKey_equivalent_of_x() {
        let keyCombination = KeyCombination(key: .x)

        XCTAssertEqual(keyCombination.vimKey, VimKey.x)
    }

    func test_that_X_has_a_VimKey_equivalent_of_X() {
        let keyCombination = KeyCombination(key: .x, shift: true)

        XCTAssertEqual(keyCombination.vimKey, VimKey.X)
    }

}

// test VimKeys that don't exist, or exist but are not implemented
// this is not testing all combinations. just a few ones to show whether
// i have been made aware of this which is  located in KeyCombination.vimKeyFrom()
extension KeyCombinationTests {

    func test_that_key_combinations_that_do_not_exist_have_no_VimKey_equivalent() {
        let optionA = KeyCombination(key: .a, option: true)
        XCTAssertNil(optionA.vimKey)
        
        let commandB = KeyCombination(key: .b, command: true)
        XCTAssertNil(commandB.vimKey)
        
        let controlShiftC = KeyCombination(key: .c, control: true, shift: true)
        XCTAssertNil(controlShiftC.vimKey)
    }
    
    func test_that_key_combinations_that_exist_but_are_not_implemented_have_no_VimKey_equivalent() {
        let controlA = KeyCombination(key: .a, control: true)
        XCTAssertNil(controlA.vimKey)
        
        let shiftB = KeyCombination(key: .b, shift: true)
        XCTAssertNil(shiftB.vimKey)
        
        let controlJ = KeyCombination(key: .j, control: true)
        XCTAssertNil(controlJ.vimKey)
    }

}
