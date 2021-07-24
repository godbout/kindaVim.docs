@testable import kindaVim
import XCTest


class ASUT_VML_y_Tests: ASVM_BaseTests {
    
    override func setUp() {
        super.setUp()
        
        KindaVimEngine.shared.visualStyle = .linewise
    }
    
    private func applyMove(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        return asVisualMode.y(on: element) 
    }
    
}


// Both
extension ASUT_VML_y_Tests {
    
    func test_that_it_sets_the_Last_Yanking_Style_to_Linewise() {
        let text = """
using VM y in VM V
should set Visual Style
to Linewise
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 54,
            caretLocation: 6,
            selectedLength: 24,
            selectedText: """
VM y in VM V
should set 
""",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 19
            )
        )
        
        KindaVimEngine.shared.lastYankStyle = .characterwise
        
        _ = applyMove(on: element)
        
        XCTAssertEqual(KindaVimEngine.shared.lastYankStyle, .linewise)
    }
    
    func test_that_for_TextFields_it_yanks_the_whole_line() {
        let text = "a whole line entirely for VM V and VM y"
        let element = AccessibilityTextElement(
            role: .textField,
            value: text,
            length: 39,
            caretLocation: 0,
            selectedLength: 39,
            selectedText: "a whole line entirely for VM V and VM y",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 1,
                start: 0,
                end: 39
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), "a whole line entirely for VM V and VM y")   
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// TextViews
extension ASUT_VML_y_Tests {
    
    func test_that_for_TextViews_it_yanks_the_selected_lines() {
        let text = """
gonna be dealing
with VM V over
why the fuck am
i writing this?
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 63,
            caretLocation: 17,
            selectedLength: 46,
            selectedText: """
with VM V over
why the fuck am
i writing this?
""",
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 17,
                end: 32
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(NSPasteboard.general.string(forType: .string), """
with VM V over
why the fuck am
i writing this?
"""
        )
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
    func test_that_after_yanking_it_gets_back_to_the_caret_position() {
        let text = """
yes even in multilne
it goes back to
the crazy caret location and
not the anchor!
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 81,
            caretLocation: 21,
            selectedLength: 45,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 21,
                end: 37
            )
        )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 21)
        XCTAssertEqual(returnedElement?.selectedLength, 1)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}


// emojis
extension ASUT_VML_y_Tests {
    
    func test_that_it_handles_emojis() {
        let text = """
yes even in multilne
🔥️t goes back to
the crazy caret location and
not the anchor!
"""
        let element = AccessibilityTextElement(
            role: .textArea,
            value: text,
            length: 83,
            caretLocation: 21,
            selectedLength: 47,
            currentLine: AccessibilityTextElementLine(
                fullValue: text,
                number: 2,
                start: 21,
                end: 39
                )
            )
        
        let returnedElement = applyMove(on: element)
        
        XCTAssertEqual(returnedElement?.caretLocation, 21)
        XCTAssertEqual(returnedElement?.selectedLength, 3)
        XCTAssertNil(returnedElement?.selectedText)
    }
    
}
