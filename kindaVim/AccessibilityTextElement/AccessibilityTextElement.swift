// REMINDER:
// internalText if for internal use only
// which means, mainly to search for where to position the caret
// the internalText is not sent back to the focused AXUIElement
// because that would rewrite the whole thing, which is slow and flickers badly in some cases
// like, for example, in Xcode 😅️
// so the way we handle this is by using the SelectedText and SelectedTextRange to remove or add
// what we need in the current buffer, rather than pushing the full text.

struct AccessibilityTextElement {

    private(set) var axText = ""
    
    var axCaretLocation = 0
    var axSelectedLength = 0

    private(set) var axLineStart = 0
    private(set) var axLineEnd = 0

}
