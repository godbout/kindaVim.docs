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
    
    var axValue: String
    let number: Int?
    let start: Int?
    let end: Int?
    
    func endLimit() -> Int {
        guard end! - start! > 1 else { return start! }

        let lineStart = axValue.index(axValue.startIndex, offsetBy: start!)
        let lineEnd = axValue.index(lineStart, offsetBy: end! - start!)

        return axValue[lineStart..<lineEnd].hasSuffix("\n") ? end! - 2 : end! - 1
    }

    func startLimit() -> Int {
        return start!
    }
    
}


struct AccessibilityTextElement {

    private(set) var axRole: AccessibilityTextElementRole = .someOtherShit
    private(set) var axValue = ""
    
    var axCaretLocation = 0
    var axSelectedLength = 0
    
    var currentLine: AccessibilityTextElementLine!
    
    var columnNumber: Int? {
        if let lineStart = currentLine.start {
            return axCaretLocation - lineStart
        }
        
        return nil
    }
    
    func isNotEmpty() -> Bool {
        return axValue.count != 0
    }

    func caretIsAtTheEnd() -> Bool {
        return currentLine.start == nil && currentLine.end == nil
    }

    func caretIsNotAtTheEnd() -> Bool {
        return currentLine.start != nil && currentLine.end != nil
    }

    func lastCharacterIsNotLinefeed() -> Bool {
        return axValue.last != "\n"
    }

}
