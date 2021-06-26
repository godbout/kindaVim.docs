// REMINDER:
// internalText if for internal use only
// which means, mainly to search for where to position the caret
// the internalText is not sent back to the focused AXUIElement
// because that would rewrite the whole thing, which is slow and flickers badly in some cases
// like, for example, in Xcode :D
// so the way we handle this is by using the SelectedText and SelectedTextRange to remove or add
// what we need in the current buffer, rather than pushing the full text.

enum AccessibilityTextElementRole {
    
    case textField
    case textArea
    case someOtherShit
    
}


struct AccessibilityTextElementLine {
    
    var fullValue: String
    var value: String {
        guard let start = start, let end = end else { return "" }
        
        let lineStartIndex = fullValue.index(fullValue.startIndex, offsetBy: start)
        let lineEndIndex = fullValue.index(lineStartIndex, offsetBy: end - start)
        
        return String(fullValue[lineStartIndex..<lineEndIndex])
    }
    let number: Int?
    let start: Int?
    let end: Int?
    var length: Int? {
        guard let start = start, let end = end else { return nil }
        
        return end - start        
    }
    var lengthWithoutLinefeed: Int? {
        guard let length = length else { return nil }
        
        return value.hasSuffix("\n") ? length - 1 : length
    }
    
    var endLimit: Int? {
        guard let start = start, let end = end else { return nil }
        guard end - start > 1 else { return start }

        return value.hasSuffix("\n") ? end - 2 : end - 1
    }
    
    var isNotAnEmptyLine: Bool {
        return !isAnEmptyLine
    }

    var startLimit: Int? {
        guard let start = start else { return nil }

        return start
    }
    
    var isTheFirstLine: Bool {
        return start == 0
    }
    
    var isTheLastLine: Bool {
        return !value.hasSuffix("\n")
    }

    var isAnEmptyLine: Bool {
        // if start and end are nil, then the insertion point is after the last character of the TextField
        // this is not possible to reach without clicking there, but still
        // because Apple's AX API returns nil for everything, we can't grab the line range for that line
        // therefore the line.value is "", therefore we need to check against the fullValue coming from the
        // element.
        // probably later we need to refactor the line.value so that if start and end are nil then
        // we grab the last sentence of the fullValue, like from last index until we fine a linefeed, rolling
        // backwards
        guard let _ = start, let _ = end else { return fullValue.last == "\n" }

        return value == "\n"
    }
    
}


extension AccessibilityTextElementLine: Equatable {
    public static func == (lhs: AccessibilityTextElementLine, rhs: AccessibilityTextElementLine) -> Bool {
        lhs.fullValue == rhs.fullValue
            && lhs.number == rhs.number
            && lhs.start == rhs.start
            && lhs.end == rhs.end
    }
}


struct AccessibilityTextElement {

    static var globalColumnNumber = 1

    private(set) var role: AccessibilityTextElementRole = .someOtherShit
    private(set) var value = ""
    
    var caretLocation = 0 {
        didSet {
            if let lineForLocation = AccessibilityTextElementAdaptor.lineFor(location: caretLocation), let lineStart = lineForLocation.start {
                Self.globalColumnNumber = caretLocation - lineStart + 1
            }
        }
    }
    var selectedLength = 0 {
        didSet {
            if VimEngine.shared.currentMode == .visual, AccessibilityStrategyVisualMode.anchor != nil {
                if caretLocation < AccessibilityStrategyVisualMode.anchor {
                    AccessibilityStrategyVisualMode.head = caretLocation
                } else {
                    AccessibilityStrategyVisualMode.head = caretLocation + selectedLength - 1
                }
            }
        }
    }
    var selectedText: String?
    
    var currentLine: AccessibilityTextElementLine!
    
    var isEmpty: Bool {
        return value.isEmpty
    }
    
    var isNotEmpty: Bool {
        return !isEmpty
    }

    var caretIsAtTheEnd: Bool {
        return currentLine.start == nil && currentLine.end == nil
    }
    
    var lastCharacterIsLinefeed: Bool {
        return value.last == "\n"
    }

    var lastCharacterIsNotLinefeed: Bool {
        return !lastCharacterIsLinefeed
    }

}


extension AccessibilityTextElement: Equatable {
    
    public static func == (lhs: AccessibilityTextElement, rhs: AccessibilityTextElement) -> Bool {
        lhs.role == rhs.role
            && lhs.value == rhs.value
            && lhs.caretLocation == rhs.caretLocation
            && lhs.selectedLength == rhs.selectedLength
            && lhs.selectedText == rhs.selectedText
            && lhs.currentLine == rhs.currentLine
    }
    
}
