extension AccessibilityStrategyNormalMode {
    
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        newElement.caretLocation = element.currentLine.endLimit
        newElement.selectedLength = element.currentLine.characterAtEndLimitLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
