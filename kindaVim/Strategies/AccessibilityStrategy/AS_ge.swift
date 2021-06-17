extension AccessibilityStrategy {
    
    func ge(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        
        element.caretLocation = textEngine.endOfWordBackward(startingAt: element.caretLocation, in: element.value)  
        
        return element
    }
    
}