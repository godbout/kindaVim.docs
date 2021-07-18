@testable import kindaVim
import XCTest


// here we gonna test all the ATE computed properties to make sure that when
// we use them later in the moves they're not full of shit :D
class AccessibilityTextElementTests: XCTestCase {}


// without emojis
// The 3 Cases:
// - empty TextElement
// - 2nd case is now gone!
// - caret at the end of TextElement on own empty line
extension AccessibilityTextElementTests {
    
    func test_that_without_emojis_if_the_TextElement_is_empty_the_computed_properties_are_correctly_calculated() {
        let text = ""
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 0,
            caretLocation: 0,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 0
            )
        )
        
        XCTAssertEqual(element.characterLength, 0)
        XCTAssertEqual(element.nextCharacterLength, 0)
        XCTAssertEqual(element.previousCharacterLength, 0)
    }
        
    func test_that_without_emojis_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_the_computed_properties_are_correctly_calculated() {
        let text = """
caret is on its
own empty
line

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 31,
            caretLocation: 31,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 4,
                start: 31,
                end: 31
            )
        )
        
        XCTAssertEqual(element.characterLength, 0)
        XCTAssertEqual(element.nextCharacterLength, 0)
        XCTAssertEqual(element.previousCharacterLength, 1)
    }
            
}


// without emojis
// other cases
extension AccessibilityTextElementTests {
    
    func test_that_without_emojis_in_normal_setting_the_computed_properties_are_correctly_calculated() {
        let text = "hehehe motherfuckers"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 20,
            caretLocation: 8,
            selectedLength: 1,
            selectedText: "o",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 20
            )
        )
        
        XCTAssertEqual(element.characterLength, 1)
        XCTAssertEqual(element.nextCharacterLength, 1)
        XCTAssertEqual(element.previousCharacterLength, 1)
    }
    
}


// with emojis
// The 3 Cases:
// - empty TextElement
// - 2nd case is now gone!
// - caret at the end of TextElement on own empty line
extension AccessibilityTextElementTests {
    
    // well empty but with emojis. how does that work? :D
    func test_that_with_emojis_if_the_TextElement_is_empty_the_computed_properties_are_correctly_calculated() {}
    
    func test_that_with_emojis_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_the_computed_properties_are_correctly_calculated() {
        let text = """
caret is on its
own empty
line 🌻️

"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 35,
            caretLocation: 35,
            selectedLength: 0,
            selectedText: "",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 4,
                start: 35,
                end: 35
            )
        )
        
        XCTAssertEqual(element.characterLength, 0)
        XCTAssertEqual(element.nextCharacterLength, 0)
        // previous is linefeed, not sunflower :D
        XCTAssertEqual(element.previousCharacterLength, 1)
    }
    
}


extension AccessibilityTextElementTests {
    
    func test_that_with_emojis_in_normal_setting_the_computed_properties_are_correctly_calculated() {
        let text = "hehehe mot💌️😂️🇫🇷️rfuckers"
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 29,
            caretLocation: 13,
            selectedLength: 3,
            selectedText: "😂️",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 29
            )
        )
        
        XCTAssertEqual(element.characterLength, 3)
        XCTAssertEqual(element.nextCharacterLength, 5)
        XCTAssertEqual(element.previousCharacterLength, 3)
    }
    
}
