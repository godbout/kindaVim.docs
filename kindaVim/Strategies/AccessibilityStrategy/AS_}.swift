extension AccessibilityStrategy {
    
    func rightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.caretLocation = textEngine.endOfParagraphForward(startingAt: element.caretLocation, in: element.value)
        
        return element
    }
    
}
