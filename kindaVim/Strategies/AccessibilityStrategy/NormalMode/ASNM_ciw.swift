extension AccessibilityStrategyNormalMode {
    
    func ciw(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }                
        
        let wordRange = textEngine.innerWord(startingAt: element.caretLocation, in: element.value)
        
        element.caretLocation = wordRange.lowerBound
        element.selectedLength = wordRange.count
        element.selectedText = ""
        
        return element
    }
    
}
