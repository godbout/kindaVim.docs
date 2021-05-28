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

struct AccessibilityTextElementLine {
    
    var fullValue: String
    let number: Int?
    let start: Int?
    let end: Int?
    var length: Int? {
        guard let start = start, let end = end else { return nil }
        
        return end - start        
    }
    
    func endLimit() -> Int? {
        guard let start = start, let end = end else { return nil }
        guard end - start > 1 else { return start }

        let lineStart = fullValue.index(fullValue.startIndex, offsetBy: start)
        let lineEnd = fullValue.index(lineStart, offsetBy: end - start)

        return fullValue[lineStart..<lineEnd].hasSuffix("\n") ? end - 2 : end - 1
    }

    func startLimit() -> Int? {
        guard let start = start else { return nil }

        return start
    }

    func isLastLine() -> Bool {
        return start == nil && end == nil
    }

    func isOnlyALinefeedCharacter() -> Bool {
        guard let start = start, let end = end else { return fullValue.last == "\n" }

        let lineStart = fullValue.index(fullValue.startIndex, offsetBy: start)
        let lineEnd = fullValue.index(lineStart, offsetBy: end - start)

        return fullValue[lineStart..<lineEnd] == "\n"
    }
    
}


struct AccessibilityTextElement {

    static var globalColumnNumber = 1

    private(set) var role: AccessibilityTextElementRole = .someOtherShit
    private(set) var value = ""
    
    var caretLocation = 0 {
        didSet {
            if let currentLineStart = currentLine.start {
                Self.globalColumnNumber = caretLocation - currentLineStart + 1
            }
        }
    }
    var selectedLength = 0
    
    var currentLine: AccessibilityTextElementLine!

    
    func isNotEmpty() -> Bool {
        return value.count != 0
    }

    func caretIsAtTheEnd() -> Bool {
        return currentLine.start == nil && currentLine.end == nil
    }

    func lastCharacterIsNotLinefeed() -> Bool {
        return value.last != "\n"
    }

}
