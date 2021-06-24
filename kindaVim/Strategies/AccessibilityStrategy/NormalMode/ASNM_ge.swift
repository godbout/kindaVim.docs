extension AccessibilityStrategy {
    
    func ge(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
                
        element.caretLocation = textEngine.endOfWordBackward(
            startingAt: element.caretLocation,
            in: TextEngineText(from: element.value)
        )
        
        return element
    }
    
}
