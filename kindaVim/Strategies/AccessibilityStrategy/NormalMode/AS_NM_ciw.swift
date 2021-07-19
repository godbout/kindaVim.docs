extension AccessibilityStrategyNormalMode {
    
    func ciw(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }                
        var newElement = element
        
        let wordRange = textEngine.innerWord(startingAt: element.caretLocation, in: TextEngineText(from: element.value))
        
        newElement.caretLocation = wordRange.lowerBound
        newElement.selectedLength = wordRange.count
        newElement.selectedText = ""
        
        return newElement
    }
    
}
