extension AccessibilityStrategyNormalMode {
    
    func E(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
                
        element.caretLocation = textEngine.endOfWORDForward(
            startingAt: element.caretLocation,
            in: TextEngineText(from: element.value)
        )  
        
        return element
    }
    
}
