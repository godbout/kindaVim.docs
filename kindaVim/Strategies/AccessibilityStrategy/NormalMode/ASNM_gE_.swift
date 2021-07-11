extension AccessibilityStrategyNormalMode {
    
    func gE(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.caretLocation = textEngine.endOfWORDBackward(startingAt: element.caretLocation, in: TextEngineText(from: element.value))  
        
        element.selectedLength = 0
        element.selectedText = nil
        
        return element
    }
    
}
