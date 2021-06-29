extension AccessibilityStrategyNormalMode {
    
    func df(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
        
        
        if let elementFound = f(to: character, on: element), element != elementFound {
            element.selectedLength = (elementFound.caretLocation + 1) - element.caretLocation
            element.selectedText = ""
        }
        
        return element
    }
    
}
