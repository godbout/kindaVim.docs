extension AccessibilityStrategyNormalMode {
    
    func dt(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.selectedLength = 0
        element.selectedText = nil
        
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return element
        }
        
        
        if let elementFound = t(to: character, on: element), elementFound.caretLocation != element.caretLocation {
            element.selectedLength = (elementFound.caretLocation + 1) - element.caretLocation
            element.selectedText = ""
        }
        
        return element
    }
    
}
