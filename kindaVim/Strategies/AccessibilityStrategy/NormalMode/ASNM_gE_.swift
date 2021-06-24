extension AccessibilityStrategy {
    
    func gE(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.caretLocation = textEngine.endOfWORDBackward(
            startingAt: element.caretLocation,
            in: TextEngineText(from: element.value)
        )  
        
        return element
    }
    
}
