extension AccessibilityStrategy {
    
    func e(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
                
        element.caretLocation = textEngine.endOfWordForward(
            startingAt: element.caretLocation,
            in: TextEngineText(from: element.value)
        )  
        
        return element
    }
    
}
