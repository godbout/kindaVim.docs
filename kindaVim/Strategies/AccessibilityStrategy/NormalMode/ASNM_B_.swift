extension AccessibilityStrategy {
    
    func B(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.caretLocation = textEngine.beginningOfWORDBackward(
            startingAt: element.caretLocation,
            in: TextEngineText(from: element.value)
        )  
        
        return element
    }
    
}
