@testable import kindaVim
import XCTest


class ASVMC_y_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.visualStyle = .characterwise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.y(on: element) 
    }
    
}


// Both
extension ASVMC_y_Tests {
    
    func test_that_it_sets_the_Last_Yanking_Style_to_Characterwise() {
        let text = """
using VM y in VM v
should set Visual Style
to Characterwise
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 59,
            caretLocation: 5,
            selectedLength: 29,
            selectedText: """
 VM y in VM v
should set Visu
""",
            currentLine: AccessibilityTextElementLine(
            fullValue: text,
                number: 1,
                start: 0,
                end: 19
            )
        )
        
        KindaVimEngine.shared.lastYankStyle = .linewise
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(KindaVimEngine.shared.lastYankStyle, .characterwise)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_it_yanks_the_selection() {
        let text = "well VM v plus then VM y should copy the selected text."
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 55,
            caretLocation: 15,
            selectedLength: 27,
            selectedText: "then VM y should copy the s",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 55
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "then VM y should copy the s")
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)        
    }
    
    func test_that_after_yanking_it_gets_back_to_the_caret_position() {
        let text = "after yanking you go back to caret you bastard!"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 47,
            caretLocation: 8,
            selectedLength: 31,
            selectedText: "nking you go back to caret you ",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 47
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 8)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_TextElement_is_empty_it_works_and_copies_the_emptiness_of_life() {
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
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 1 of The 3 Cases VM y", forType: .string)
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "")
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_if_the_caret_is_at_the_last_character_of_the_TextElement_and_on_an_empty_line_on_its_own_it_works_and_copies_nothing() {
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
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString("test 3 of The 3 Cases VM y", forType: .string)
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "")
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }   
    
}
