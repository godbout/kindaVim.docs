extension AccessibilityStrategyNormalMode {
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.role == .textArea else { return nil }
        
        element.selectedLength = 0
        element.selectedText = nil
        
        
        if element.isEmpty {
            return element
        }
        
        
        var previousLine: AccessibilityTextElementLine?
        
        if element.caretIsAtTheEnd {
            previousLine = AccessibilityTextElementAdaptor.lineFor(location: element.caretLocation - 1)
        } else {
            previousLine = AccessibilityTextElementAdaptor.lineFor(location: element.currentLine.start - 1)
        }
        
        if let previousLine = previousLine {
            if previousLine.length > AccessibilityTextElement.globalColumnNumber {
                element.caretLocation = previousLine.start + AccessibilityTextElement.globalColumnNumber - 1
            } else {
                let globalColumnNumber = AccessibilityTextElement.globalColumnNumber
                element.caretLocation = previousLine.endLimit
                AccessibilityTextElement.globalColumnNumber = globalColumnNumber
            }
        }
        
        return element
    }
    
}
