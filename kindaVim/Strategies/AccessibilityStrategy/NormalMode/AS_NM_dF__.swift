extension AccessibilityStrategyNormalMode {
    
    func dF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        if let elementFound = F(to: character, on: element), elementFound.caretLocation != element.caretLocation  {
            newElement.caretLocation = elementFound.caretLocation
            newElement.selectedLength = element.caretLocation - elementFound.caretLocation
            newElement.selectedText = ""
            
            return newElement
        }
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement      
    }
    
}
