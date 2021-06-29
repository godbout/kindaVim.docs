extension AccessibilityStrategyNormalMode {
    
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
        
        
        if let nextLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number + 1) {
            if nextLine.isTheLastLine, nextLine.isAnEmptyLine {
                let globalColumNumber = AccessibilityTextElement.globalColumnNumber
                element.caretLocation = element.length
                AccessibilityTextElement.globalColumnNumber = globalColumNumber
            } else {
                if nextLine.length > AccessibilityTextElement.globalColumnNumber {
                    element.caretLocation = nextLine.start + AccessibilityTextElement.globalColumnNumber - 1
                } else {
                    let globalColumNumber = AccessibilityTextElement.globalColumnNumber
                    element.caretLocation = nextLine.endLimit
                    AccessibilityTextElement.globalColumnNumber = globalColumNumber
                }
            }
        } else {
            element.caretLocation = element.length
        }
        
        return element
    }
    
}
