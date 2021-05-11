@testable import kindaVim
import XCTest

class AccessibilityElementAdaptorTest: XCTestCase {

    func test_that_it_can_convert_an_AccessibilityElement_to_an_AXUIElement() {
        // how to do that?
        // maybe see below? maybe i'm mixing both cases lol
    }

    func test_that_it_can_convert_an_AXUIElement_to_an_AccessibilityElement() {
        // need to create a fake AXUIElement here
        // but it's not possible in itself
        // so need to create fake fields with AXUIElement attached.
        // probably need to have a look at XCUIElement
        // and also create a window with different types of elements
        // like one line input field, multiple line, buttons etc
        // and run the tests on maybe all of them?
    }
}
