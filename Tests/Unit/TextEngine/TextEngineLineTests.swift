@testable import kindaVim
import XCTest


// see TextEngineText for blah blah
class TextEngineLineTests: XCTestCase {}


// without emojis
// weird state of the 3 cases. coz only line here
extension TextEngineLineTests {
    
    func test_that_without_emojis_if_the_line_is_empty_the_computed_properties_are_correctly_calculated() {
        let text = ""
        let textEngineLine = TextEngineLine(from: text)
        
        XCTAssertEqual(textEngineLine.value, "")
        XCTAssertEqual(textEngineLine.start, 0)
        XCTAssertEqual(textEngineLine.end, 0)
        XCTAssertEqual(textEngineLine.endLimit, 0)
        XCTAssertEqual(textEngineLine.isEmpty, true)
        XCTAssertEqual(textEngineLine.isNotEmpty, false)
        XCTAssertEqual(textEngineLine.isOnlyALinefeedCharacter, false)
    }    
    
}


// without emojis
// other cases
extension TextEngineLineTests {
    
    func test_that_without_emojis_for_a_line_without_a_linefeed_the_computed_properties_are_correctly_calculated() {
        let text = "here we go baby fucking hell"
        let textEngineLine = TextEngineLine(from: text)
        
        XCTAssertEqual(textEngineLine.value, "here we go baby fucking hell")
        XCTAssertEqual(textEngineLine.start, 0)
        XCTAssertEqual(textEngineLine.end, 28)
        XCTAssertEqual(textEngineLine.endLimit, 27)
        XCTAssertEqual(textEngineLine.isEmpty, false)
        XCTAssertEqual(textEngineLine.isNotEmpty, true)
        XCTAssertEqual(textEngineLine.isOnlyALinefeedCharacter, false)
        
    }
    
    func test_that_without_emojis_for_a_line_with_a_linefeed_the_computed_properties_are_correctly_calculated() {
        let text = "now i'm a line with a linefeed\n"
        let textEngineLine = TextEngineLine(from: text)
        
        XCTAssertEqual(textEngineLine.value, "now i'm a line with a linefeed\n")
        XCTAssertEqual(textEngineLine.start, 0)
        XCTAssertEqual(textEngineLine.end, 31)
        XCTAssertEqual(textEngineLine.endLimit, 29)
        XCTAssertEqual(textEngineLine.isEmpty, false)
        XCTAssertEqual(textEngineLine.isNotEmpty, true)
        XCTAssertEqual(textEngineLine.isOnlyALinefeedCharacter, false)
    }
    
}


// with emojis
// well no 3 cases as only lines and empty line don't have emojis :D
extension TextEngineLineTests {}


// with emojis
// other cases
extension TextEngineLineTests {
    
    func test_that_with_emojis_in_normal_setting_the_computed_properties_are_correctly_calculated() {
        let text = "here we go baby 😂️ 💩️💩️💩️ fucking hell"
        let textEngineLine = TextEngineLine(from: text)
        
        XCTAssertEqual(textEngineLine.value, "here we go baby 😂️ 💩️💩️💩️ fucking hell")
        XCTAssertEqual(textEngineLine.start, 0)
        XCTAssertEqual(textEngineLine.end, 42)
        XCTAssertEqual(textEngineLine.endLimit, 41)
        XCTAssertEqual(textEngineLine.isEmpty, false)
        XCTAssertEqual(textEngineLine.isNotEmpty, true)
        XCTAssertEqual(textEngineLine.isOnlyALinefeedCharacter, false)
    }
    
    func test_that_with_emojis_for_a_line_without_a_linefeed_the_computed_properties_are_correctly_calculated_when_the_emoji_is_at_the_end() {
        let text = "i'm a line without linefeed 😅️"
        let textEngineLine = TextEngineLine(from: text)
        
        XCTAssertEqual(textEngineLine.value, "i'm a line without linefeed 😅️")
        XCTAssertEqual(textEngineLine.start, 0)
        XCTAssertEqual(textEngineLine.end, 31)
        XCTAssertEqual(textEngineLine.endLimit, 28)
        XCTAssertEqual(textEngineLine.isEmpty, false)
        XCTAssertEqual(textEngineLine.isNotEmpty, true)
        XCTAssertEqual(textEngineLine.isOnlyALinefeedCharacter, false)
    }
    
    func test_that_with_emojis_for_a_line_with_a_linefeed_the_computed_properties_are_correctly_calculated_when_the_emoji_is_right_before_the_linefeed() {
        let text = "now i'm a line with 🇲🇴️\n"
        let textEngineLine = TextEngineLine(from: text)
        
        XCTAssertEqual(textEngineLine.value, "now i'm a line with 🇲🇴️\n")
        XCTAssertEqual(textEngineLine.start, 0)
        XCTAssertEqual(textEngineLine.end, 26)
        XCTAssertEqual(textEngineLine.endLimit, 20)
        XCTAssertEqual(textEngineLine.isEmpty, false)
        XCTAssertEqual(textEngineLine.isNotEmpty, true)
        XCTAssertEqual(textEngineLine.isOnlyALinefeedCharacter, false)
    }
    
}
