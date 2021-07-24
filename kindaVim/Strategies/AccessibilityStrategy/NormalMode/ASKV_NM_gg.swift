extension AccessibilityStrategyNormalMode {
    
    func gg(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
                
        if let firstLine = AccessibilityTextElementAdaptor.lineFor(location: 0) {
            newElement.caretLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: firstLine.value))
            newElement.selectedLength = newElement.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
