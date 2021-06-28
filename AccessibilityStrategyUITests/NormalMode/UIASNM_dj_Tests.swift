@testable import kindaVim
import XCTest


class UIASNM_dj_tests: UIAS_BaseTests {
    
    private func applyMoveAndGetBackUpdatedElement() -> AccessibilityTextElement? {
        return applyMoveAndGetBackUpdatedElement { focusedElement in
            asNormalMode.dj(on: focusedElement)
        }
    }
    
}


// Both
extension UIASNM_dj_tests {
    
    func test_that_if_there_is_only_one_line_it_does_not_do_anything() {
        let textInAXFocusedElement = "one line is not enough for dj"
        app.textFields.firstMatch.tap()
        app.textFields.firstMatch.typeText(textInAXFocusedElement)
        app.textFields.firstMatch.typeKey(.leftArrow, modifierFlags: [])        
        
        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, "one line is not enough for dj")        
        XCTAssertEqual(finalElement?.caretLocation, 28)
    }    
    
}


// TextViews
extension UIASNM_dj_tests {
    
    func test_that_it_can_delete_two_lines() {
        let textInAXFocusedElement = """
like this line and the following
one should disappear
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])        
        
        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, "")        
        XCTAssertEqual(finalElement?.caretLocation, 0)
    }
    
    func test_that_if_there_are_more_than_two_lines_the_caret_goes_to_the_first_non_blank_of_the_third_line() {
        let textInAXFocusedElement = """
now this is getting cool
because it will go to the next
     non blank of this line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        
        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, """
     non blank of this line
"""
        )        
        XCTAssertEqual(finalElement?.caretLocation, 5)
    }
    
    func test_that_it_skips_the_spaces_on_the_next_line_and_that_it_therefore_keeps_the_indentation() {
        let textInAXFocusedElement = """
if someBullshit == true {
    bs = yeah
}
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.option])
        
        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, "    bs = yeah\n}")        
        XCTAssertEqual(finalElement?.caretLocation, 4)
    }
    
    func test_that_it_skips_the_tabs_on_the_next_line_and_that_it_therefore_keeps_the_indentation() {
        let textInAXFocusedElement = """
if someBullshit == true {
\tbs = yeah
}
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        app.textViews.firstMatch.typeKey(.rightArrow, modifierFlags: [.option])
        
        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, "\tbs = yeah\n}")        
        XCTAssertEqual(finalElement?.caretLocation, 1)
    }
    
    func test_that_when_it_deletes_a_line_it_ends_up_at_the_correct_indentation_on_the_next_line() {
        let textInAXFocusedElement = """
for example
  it should stop
after the two spaces
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [.command])
        
        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, "  it should stop\nafter the two spaces")        
        XCTAssertEqual(finalElement?.caretLocation, 2)            
    }
    
    func test_that_if_on_the_last_line_it_deletes_the_line_and_goes_up_to_the_first_non_blank_of_the_previous_line() {
        let textInAXFocusedElement = """
this one
    is a tough
one
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.leftArrow, modifierFlags: [])
        
        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, "this one\n    is a tough")        
        XCTAssertEqual(finalElement?.caretLocation, 13)   
    }
    
    func test_that_the_caret_ends_up_at_the_next_line_end_limit_if_the_next_line_is_just_made_out_of_non_blank_characters() {
        let textInAXFocusedElement = """
if the next line is just blank characters
then there is no firstNonBlank so we need
          
to stop at the end limit of the line
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        app.textViews.firstMatch.typeKey(.upArrow , modifierFlags: [])
        
        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, """
if the next line is just blank characters
          
to stop at the end limit of the line
"""
        )        
        XCTAssertEqual(finalElement?.caretLocation, 51)
    }
    
    func test_that_if_the_next_line_is_only_blanks_the_caret_goes_to_the_limit_of_the_line_before_the_linefeed() {
        let textInAXFocusedElement = """
we gonna use VM
dd here and we suppose
      to go to non blank of the line
         
"""
        app.textViews.firstMatch.tap()
        app.textViews.firstMatch.typeText(textInAXFocusedElement)
        app.textViews.firstMatch.typeKey(.upArrow, modifierFlags: [])
        
        let finalElement = applyMoveAndGetBackUpdatedElement()
        
        XCTAssertEqual(finalElement?.value, """
we gonna use VM
dd here and we suppose
         
"""
        )
        XCTAssertEqual(finalElement?.caretLocation, 47)    
    }
    
}

