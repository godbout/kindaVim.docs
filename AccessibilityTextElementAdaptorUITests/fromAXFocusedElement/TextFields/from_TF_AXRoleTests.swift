import XCTest

class from_TF_AXRoleTests: ATEA_BaseTests {
    
    func test_that_the_role_for_TextFields_is_correct() {
        let textInAXFocusedElement = "just need to grab the field role"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)

        let accessibilityElement = AccessibilityTextElementAdaptor.fromAXFocusedElement()

        XCTAssertEqual(accessibilityElement?.axRole, .textField)
    }

}
