extension AccessibilityStrategyNormalMode {
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.role == .textArea else { return nil }        
        
        if let previousLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number - 1) {
            if previousLine.length > AccessibilityTextElement.globalColumnNumber {
                element.caretLocation = previousLine.start + AccessibilityTextElement.globalColumnNumber - 1
            } else {
                let globalColumnNumber = AccessibilityTextElement.globalColumnNumber
                element.caretLocation = previousLine.endLimit
                AccessibilityTextElement.globalColumnNumber = globalColumnNumber
            }
        }
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
