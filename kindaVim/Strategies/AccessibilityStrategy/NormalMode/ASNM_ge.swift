extension AccessibilityStrategyNormalMode {
    
    func ge(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
                
        element.caretLocation = textEngine.endOfWordBackward(startingAt: element.caretLocation, in: TextEngineText(from: element.value))
        
        element.selectedLength = 0
        element.selectedText = nil
        
        return element
    }
    
}
