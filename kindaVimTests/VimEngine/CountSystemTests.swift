import XCTest
@testable import kindaVim
import KeyCombination


// here we test that the count system like starting with digit, adding several digits,
// if digit is added after an operator it cancels the first number, digit in the wrong place cancels the move etc, etc
// there's more tests after every single move, to test that the count (hence count buffers) is reset
class CountSystemTests: XCTestCase {

    let kindaVimEngine = KindaVimEngine()
        
    override func setUp() {
        super.setUp()
        
        kindaVimEngine.enterNormalMode()
    }
    
    
    func test_that_the_count_is_correct_when_the_command_starts_with_a_digit() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .five))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .i))
        
        XCTAssertEqual(kindaVimEngine.count, 5)
    }
        
    func test_that_the_count_is_correct_when_the_command_starts_with_a_digit_and_is_then_followed_by_another_digit() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .six))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .nine))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        
        XCTAssertEqual(kindaVimEngine.count, 69)
    }
    
    func test_that_the_count_is_correct_when_an_operator_is_followed_by_a_digit() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .nine))
        
        XCTAssertEqual(kindaVimEngine.count, 9)
    }
       
    func test_that_the_count_is_correct_when_an_operator_is_followed_by_a_digit_and_then_is_followed_by_another_digit() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .nine))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .two))
        
        XCTAssertEqual(kindaVimEngine.count, 92)
    }
    
    func test_that_if_there_is_a_count_before_and_a_count_after_an_operator_then_the_counts_are_multiplied() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .six))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .eight))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .i))
        
        XCTAssertEqual(kindaVimEngine.count, 48)
    }
    
    func test_that_the_count_is_not_reset_and_is_correct_during_an_operator_pending() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .c))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .two))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .i))
        
        XCTAssertEqual(kindaVimEngine.count, 2)
    }
    
    func test_that_the_count_is_reset_if_the_digit_during_an_operator_pending_is_entered_not_right_after_the_operator() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .two))
        
        XCTAssertNil(kindaVimEngine.count)
    }

}


// tests especially for 0 as 0 can be both a Vim move or used as
// a digit for counts
extension CountSystemTests {
    
    func test_that_if_the_command_starts_with_0_then_0_is_counted_as_a_Vim_move_and_the_count_is_nil() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .zero))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .a))
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
    func test_that_if_the_command_already_starts_with_digits_and_does_not_have_an_operator_yet_then_0_is_part_of_the_first_count() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .one))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .zero))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .four))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        
        XCTAssertEqual(kindaVimEngine.count, 104)
    }
    
    func test_that_if_the_command_already_has_an_operator_and_at_least_a_digit_after_then_0_is_part_of_the_count() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .four))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .zero))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .a))
        
        XCTAssertEqual(kindaVimEngine.count, 40)
    }
    
    func test_that_if_the_command_already_has_an_operator_but_no_digit_after_then_0_is_a_move_and_the_count_is_reset() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .zero))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .four))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .a))
        
        XCTAssertNil(kindaVimEngine.count)
    }
    
    func test_that_if_there_is_a_count_that_includes_a_0_before_and_a_count_that_includes_a_0_after_an_operator_then_the_counts_are_multiplied() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .two))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .zero))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .three))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .zero))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .zero))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .a))
        
        XCTAssertEqual(kindaVimEngine.count, 6000)
    }
    
    func test_that_the_count_is_reset_during_an_operator_pending_if_0_is_entered_not_right_after_the_operator() {
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .two))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .zero))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .d))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .three))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .a))
        kindaVimEngine.handle(keyCombination: KeyCombination(vimKey: .zero))
        
        XCTAssertNil(kindaVimEngine.count)
    }
        
}
