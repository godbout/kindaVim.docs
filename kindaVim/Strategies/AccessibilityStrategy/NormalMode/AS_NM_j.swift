extension AccessibilityStrategyNormalMode {
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.role == .textArea else { return nil }
        
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
        } else if element.currentLine.isNotTheLastLine {
            element.caretLocation = element.length
        }
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
