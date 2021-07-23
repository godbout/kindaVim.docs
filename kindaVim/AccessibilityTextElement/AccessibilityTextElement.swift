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
        let lineStartIndex = fullValue.utf16.index(fullValue.startIndex, offsetBy: start)
        let lineEndIndex = fullValue.utf16.index(lineStartIndex, offsetBy: end - start)
        
        return String(fullValue.utf16[lineStartIndex..<lineEndIndex])!
    }
    
    let number: Int
    let start: Int
    let end: Int
    var length: Int { end - start }
    var lengthWithoutLinefeed: Int { value.hasSuffix("\n") ? length - 1 : length }
    var endLimit: Int {        
        guard end - start > 1 else { return start }
        
        if value.hasSuffix("\n") {
            let characterBeforeLinefeedIndex = value.index(before: value.lastIndex(of: "\n")!)
            let characterBeforeLinefeedLength = value[characterBeforeLinefeedIndex].utf16.count
            
            return (end - 1) - characterBeforeLinefeedLength
        } else {
            let lastCharacterIndex = value.index(before: value.endIndex)
            let lastCharacterLength = value[lastCharacterIndex].utf16.count
            
            return end - lastCharacterLength
        }
    }
    
    var characterAtEndLimitLength: Int {
        let characterAtEndLimitIndex = fullValue.utf16.index(fullValue.startIndex, offsetBy: endLimit) 
        guard characterAtEndLimitIndex != fullValue.endIndex else { return 0 }
        
        return fullValue[characterAtEndLimitIndex].utf16.count
    }
    
    var isAnEmptyLine: Bool { value == "\n" || value == "" }
    var isNotAnEmptyLine: Bool { !isAnEmptyLine }
    var isTheFirstLine: Bool { start == 0 }    
    var isTheLastLine: Bool { !value.hasSuffix("\n") }
    var isNotTheLastLine: Bool { !isTheLastLine }
    
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
    private(set) var value: String
    private(set) var length: Int
    
    var caretLocation: Int {
        didSet {
            if KindaVimEngine.shared.currentMode == .normal || KindaVimEngine.shared.currentMode == .insert {
                if let lineForLocation = AccessibilityTextElementAdaptor.lineFor(location: caretLocation), lineForLocation.isNotAnEmptyLine {                    
                    Self.globalColumnNumber = (caretLocation - lineForLocation.start) + 1
                }
            }
        }
    }
    var selectedLength: Int {
        didSet {
            if KindaVimEngine.shared.currentMode == .visual {
                if AccessibilityStrategyVisualMode.anchor != nil {
                    if caretLocation < AccessibilityStrategyVisualMode.anchor {
                        AccessibilityStrategyVisualMode.head = caretLocation
                    } else if selectedLength > 0 {
                        AccessibilityStrategyVisualMode.head = caretLocation + selectedLength - 1
                    } else {
                        AccessibilityStrategyVisualMode.head = caretLocation
                    }
                }
                
                if AccessibilityStrategyVisualMode.head != nil, let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head) {
                    Self.globalColumnNumber = (AccessibilityStrategyVisualMode.head - lineAtHead.start) + 1
                }
            }
        }
    }
    var selectedText: String?
    
    var currentLine: AccessibilityTextElementLine!
    
    var characterLength: Int {
        return value.characterLengthForCharacter(at: caretLocation)
    }
    var nextCharacterLength: Int {
        return value.characterLengthForCharacter(after: caretLocation)        
    }
    var previousCharacterLength: Int {
        return value.characterLengthForCharacter(before: caretLocation)
    }
    
    func characterLengthForCharacter(at location: Int) -> Int {
        return value.characterLengthForCharacter(at: location)
    }
    
    func characterLengthForCharacter(before location: Int) -> Int {
        return value.characterLengthForCharacter(before: location)
    }
    
    var isEmpty: Bool { value.isEmpty }    
    var isNotEmpty: Bool { !isEmpty }
    var caretIsAtTheEnd: Bool { caretLocation == length }    
    var caretIsNotAtTheEnd: Bool { !caretIsAtTheEnd }
    var lastCharacterIsLinefeed: Bool { value.last == "\n" }
    var lastCharacterIsNotLinefeed: Bool { !lastCharacterIsLinefeed }

}
