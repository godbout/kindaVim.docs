extension AccessibilityStrategy {
    
    func dF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        if let elementFound = F(to: character, on: element), element != elementFound {
            element.selectedLength = element.caretLocation - elementFound.caretLocation
            element.caretLocation = elementFound.caretLocation
            element.selectedText = ""
        }
        
        return element
    }
    
}
