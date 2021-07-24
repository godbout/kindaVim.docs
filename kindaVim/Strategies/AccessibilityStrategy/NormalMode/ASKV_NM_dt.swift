extension AccessibilityStrategyNormalMode {
    
    func dt(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        if let elementFound = t(to: character, on: element), elementFound.caretLocation != element.caretLocation {
            newElement.selectedLength = (elementFound.caretLocation + elementFound.characterLength) - element.caretLocation
            newElement.selectedText = ""
            
            return newElement
        }
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
