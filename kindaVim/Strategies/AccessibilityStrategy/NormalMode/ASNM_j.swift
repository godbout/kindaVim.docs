extension AccessibilityStrategyNormalMode {
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.role == .textArea else { return nil }
        
        element.selectedLength = 0
        element.selectedText = nil
        
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        if let nextLine = AccessibilityTextElementAdaptor.lineFor(location: element.currentLine.end) {
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
        } else if element.currentLine.isNotTheLastLine {
            element.caretLocation = element.length
        }
        
        return element
    }
    
}
