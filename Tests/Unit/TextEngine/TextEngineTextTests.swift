@testable import kindaVim
import XCTest


// so this is like the AccessibilityTextElement and Line tests.
// we gonna test the computed properties because the utf16 emojis shit is killing my head :D
class TextEngineTextTests: XCTestCase {}


// without emojis
// The 3 Cases:
// - empty TextElement
// - 2nd case is now gone!
// - caret at the end of TextElement on own empty line
extension TextEngineTextTests {
    
    func test_that_without_emojis_if_the_TextElement_is_empty_the_computed_properties_are_correctly_calculated() {
        let text = ""
        let textEngineText = TextEngineText(from: text)
        
        XCTAssertEqual(textEngineText.value, "")
        XCTAssertEqual(textEngineText.endLimit, 0)
        XCTAssertEqual(textEngineText.isEmpty, true)
        XCTAssertEqual(textEngineText.isNotEmpty, false)
        XCTAssertEqual(textEngineText.isOnlyALinefeedCharacter, false)
    }
    
    func test_that_without_emojis_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_the_computed_properties_are_correctly_calculated() {
        let text = """
caret is on its
own empty
line

"""
        let textEngineText = TextEngineText(from: text)
        
        XCTAssertEqual(textEngineText.value, """
caret is on its
own empty
line

"""
        )
        XCTAssertEqual(textEngineText.endLimit, 31)
        XCTAssertEqual(textEngineText.isEmpty, false)
        XCTAssertEqual(textEngineText.isNotEmpty, true)
        XCTAssertEqual(textEngineText.isOnlyALinefeedCharacter, false)
    }
    
}


// without emojis
// other cases
extension TextEngineTextTests {
    
    func test_that_without_emojis_in_normal_setting_the_computed_properties_are_correctly_calculated() {
        let text = "hehehe motherfuckers"
        let textEngineText = TextEngineText(from: text)
        
        XCTAssertEqual(textEngineText.value, "hehehe motherfuckers")
        XCTAssertEqual(textEngineText.endLimit, 19)
        XCTAssertEqual(textEngineText.isEmpty, false)
        XCTAssertEqual(textEngineText.isNotEmpty, true)
        XCTAssertEqual(textEngineText.isOnlyALinefeedCharacter, false)
    }
    
}


// with emojis
// The 3 Cases:
// - empty TextElement
// - 2nd case is now gone!
// - caret at the end of TextElement on own empty line
extension TextEngineTextTests {
    
    // well empty but with emojis. how does that work? :D
    func test_that_with_emojis_if_the_TextElement_is_empty_the_computed_properties_are_correctly_calculated() {}
    
    func test_that_with_emojis_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_the_computed_properties_are_correctly_calculated() {
        let text = """
caret is on its
own empty
line 🌻️

"""
        let textEngineText = TextEngineText(from: text)
        
        XCTAssertEqual(textEngineText.value, """
caret is on its
own empty
line 🌻️

"""
        )
        XCTAssertEqual(textEngineText.endLimit, 35)
        XCTAssertEqual(textEngineText.isEmpty, false)
        XCTAssertEqual(textEngineText.isNotEmpty, true)
        XCTAssertEqual(textEngineText.isOnlyALinefeedCharacter, false)
    }
    
}


extension TextEngineTextTests {
    
    func test_that_with_emojis_in_normal_setting_the_computed_properties_are_correctly_calculated() {
        let text = "hehehe mot💌️😂️🇫🇷️rfuckers"
        let textEngineText = TextEngineText(from: text)
        
        XCTAssertEqual(textEngineText.value, "hehehe mot💌️😂️🇫🇷️rfuckers");
        XCTAssertEqual(textEngineText.endLimit, 28)
        XCTAssertEqual(textEngineText.isEmpty, false)
        XCTAssertEqual(textEngineText.isNotEmpty, true)
        XCTAssertEqual(textEngineText.isOnlyALinefeedCharacter, false)
    }
    
    func test_that_with_emojis_for_a_text_that_does_not_end_with_a_linefeed_the_computed_properties_are_correctly_calculated_when_the_emoji_is_at_the_end() {
        let text = "i'm a line without linefeed 😅️"
        let textEngineText = TextEngineText(from: text)
        
        XCTAssertEqual(textEngineText.value, "i'm a line without linefeed 😅️");
        XCTAssertEqual(textEngineText.endLimit, 28)
        XCTAssertEqual(textEngineText.isEmpty, false)
        XCTAssertEqual(textEngineText.isNotEmpty, true)
        XCTAssertEqual(textEngineText.isOnlyALinefeedCharacter, false)
    }
    
}
