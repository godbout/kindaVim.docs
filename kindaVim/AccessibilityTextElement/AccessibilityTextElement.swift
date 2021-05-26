// REMINDER:
// internalText if for internal use only
// which means, mainly to search for where to position the caret
// the internalText is not sent back to the focused AXUIElement
// because that would rewrite the whole thing, which is slow and flickers badly in some cases
// like, for example, in Xcode 😅️
// so the way we handle this is by using the SelectedText and SelectedTextRange to remove or add
// what we need in the current buffer, rather than pushing the full text.

enum AccessibilityTextElementRole {
    
    case textField
    case textArea
    case someOtherShit
    
}


struct AccessibilityTextElement {

    private(set) var axRole: AccessibilityTextElementRole = .someOtherShit
    private(set) var axValue = ""
    
    var axCaretLocation = 0
    var axSelectedLength = 0

    private(set) var axLineNumber: Int?
    private(set) var axLineStart: Int?
    private(set) var axLineEnd: Int?

    
    func isNotEmpty() -> Bool {
        return axValue.count != 0
    }

    func caretIsAtTheEnd() -> Bool {
        return axLineStart == nil && axLineEnd == nil
    }

    func caretIsNotAtTheEnd() -> Bool {
        return axLineStart != nil && axLineEnd != nil
    }

    func endOfLineLimit() -> Int {
        guard axLineEnd! - axLineStart! > 1 else { return axLineStart! }

        let lineStart = axValue.index(axValue.startIndex, offsetBy: axLineStart!)
        let lineEnd = axValue.index(lineStart, offsetBy: axLineEnd! - axLineStart!)

        return axValue[lineStart..<lineEnd].hasSuffix("\n") ? axLineEnd! - 2 : axLineEnd! - 1
    }

    func startOfLineLimit() -> Int {
        return axLineStart!
    }

    func lastCharacterIsNotLinefeed() -> Bool {
        return axValue.last != "\n"
    }

}
