import XCTest


// bug in Big Sur and Monterey where the character right after
// the start of a line, if selected through mouse or AX (but not keyboard),
// will return data from the previous line.
// reported as FB9114768 but as usual, i should just put it up my asshole
class BigSurBugTests: ATEA_BaseTests {
    
    func test_that_we_grab_a_correct_AccessibilityTextElement_from_the_character_right_after_the_start_of_a_line() {
        let textInAXFocusedElement = """
some fucking
shit
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.shift])
        
        // the bug happens only when setting the selection through mouse or AX
        // which is why we have to grab the element, push it back to AX to make it fail
        // and grabbing it again for testing.
        // we also need to set selectedText to nil else the AX API automatically
        // sets the selectedLength to 0 once it sets the text
        var accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        accessibilityElement?.selectedText = nil
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: accessibilityElement!)
        accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.role, .textArea)
        XCTAssertEqual(accessibilityElement?.value, """
some fucking
shit
"""
        )
        XCTAssertEqual(accessibilityElement?.length, 17)
        XCTAssertEqual(accessibilityElement?.caretLocation, 13)
        XCTAssertEqual(accessibilityElement?.selectedLength, 1)
        XCTAssertEqual(accessibilityElement?.currentLine.fullValue, """
some fucking
shit
"""
        )
        XCTAssertEqual(accessibilityElement?.currentLine.number, 2)
        XCTAssertEqual(accessibilityElement?.currentLine.start, 13)
        XCTAssertEqual(accessibilityElement?.currentLine.end, 17)
    }
    
    func test_that_we_grab_a_correct_AccessibilityTextElement_from_the_character_right_before_the_start_of_a_line() {
        let textInAXFocusedElement = """
some fucking
shit
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.shift])
        
        var accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        accessibilityElement?.selectedText = nil
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: accessibilityElement!)
        accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.role, .textArea)
        XCTAssertEqual(accessibilityElement?.value, """
some fucking
shit
"""
        )
        XCTAssertEqual(accessibilityElement?.length, 17)
        XCTAssertEqual(accessibilityElement?.caretLocation, 12)
        XCTAssertEqual(accessibilityElement?.selectedLength, 1)
        XCTAssertEqual(accessibilityElement?.currentLine.fullValue, """
some fucking
shit
"""
        )
        XCTAssertEqual(accessibilityElement?.currentLine.number, 1)
        XCTAssertEqual(accessibilityElement?.currentLine.start, 0)
        XCTAssertEqual(accessibilityElement?.currentLine.end, 13)
    }
    
    func test_that_we_grab_a_correct_AccessibilityTextElement_even_when_the_last_character_is_by_its_own_on_the_last_line() {
        let textInAXFocusedElement = """
that big sur shit
LOL
6
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.shift])
        
        var accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        accessibilityElement?.selectedText = nil
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: accessibilityElement!)
        accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()
        
        XCTAssertEqual(accessibilityElement?.role, .textArea)
        XCTAssertEqual(accessibilityElement?.value, """
that big sur shit
LOL
6
"""
        )
        XCTAssertEqual(accessibilityElement?.length, 23)
        XCTAssertEqual(accessibilityElement?.caretLocation, 22)
        XCTAssertEqual(accessibilityElement?.selectedLength, 1)
        XCTAssertEqual(accessibilityElement?.currentLine.fullValue, """
that big sur shit
LOL
6
"""
        )
        XCTAssertEqual(accessibilityElement?.currentLine.number, 3)
        XCTAssertEqual(accessibilityElement?.currentLine.start, 22)
        XCTAssertEqual(accessibilityElement?.currentLine.end, 23)
    }
    
}
