extension AccessibilityStrategy {
    
    func E(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        
        element.caretLocation = textEngine.endOfWORDForward(startingAt: element.caretLocation, in: element.value)  
        
        return element
    }
    
}
