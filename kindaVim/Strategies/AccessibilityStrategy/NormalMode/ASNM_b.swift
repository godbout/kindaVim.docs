extension AccessibilityStrategyNormalMode {
    
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.caretLocation = textEngine.beginningOfWordBackward(startingAt: element.caretLocation, in: TextEngineText(from: element.value))        
        element.selectedLength = 1
        element.selectedText = nil
         
        return element
    }
    
}
