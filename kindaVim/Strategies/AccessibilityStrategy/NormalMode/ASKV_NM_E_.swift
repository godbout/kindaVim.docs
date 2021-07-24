extension AccessibilityStrategyNormalMode {
    
    func E(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
                
        newElement.caretLocation = textEngine.endOfWORDForward(startingAt: element.caretLocation, in: TextEngineText(from: element.value))  
        newElement.selectedLength = newElement.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
