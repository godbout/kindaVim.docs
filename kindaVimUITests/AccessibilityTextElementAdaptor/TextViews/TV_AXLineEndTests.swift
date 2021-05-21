import XCTest

class TV_AXLineEndTests: ATEA_BaseTests {}

// from AXUIElement
extension TV_AXLineEndTests {

    func test_that_the_line_end_is_correct_if_caret_is_between_the_beginning_and_the_end_of_a_TextView() {
        let textInAXFocusedElement = """
        hello
        bah bha bah
        is there anyone at home?
        """
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [])

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axLineEnd, 18)
    }

}

// to AXUIElement
// same. no idea if we're ever gonna set the line start or not
extension TV_AXLineEndTests {}
