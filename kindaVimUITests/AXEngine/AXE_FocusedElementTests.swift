@testable import kindaVim
import XCTest

class AXE_FocusedElement: AXE_BaseTests {

    func test_that_it_can_get_the_AX_Focused_Element() {
        XCTAssertNotNil(AXEngine.axFocusedElement())
    }

}
