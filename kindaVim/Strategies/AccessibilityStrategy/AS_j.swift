extension AccessibilityStrategy {
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.role == .textArea else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        if let currentLineNumber = element.currentLine.number, let nextLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: currentLineNumber + 1) {
            if nextLine.isLastLine, nextLine.isOnlyALinefeedCharacter {
                let globalColumNumber = AccessibilityTextElement.globalColumnNumber
                element.caretLocation = element.value.count
                AccessibilityTextElement.globalColumnNumber = globalColumNumber
            } else {
                if let nextLineLength = nextLine.length, nextLineLength > AccessibilityTextElement.globalColumnNumber {
                    element.caretLocation = nextLine.start! + AccessibilityTextElement.globalColumnNumber - 1
                } else {
                    if let endLimit = nextLine.endLimit {
                        let globalColumNumber = AccessibilityTextElement.globalColumnNumber
                        element.caretLocation = endLimit
                        AccessibilityTextElement.globalColumnNumber = globalColumNumber
                    }
                }
            }
        }
        
        return element
    }
    
}
