extension AccessibilityStrategyNormalMode {
    
    func df(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if let elementFound = f(to: character, on: element), elementFound.caretLocation != element.caretLocation {
            element.selectedLength = (elementFound.caretLocation + 1) - element.caretLocation
            element.selectedText = ""
            
            return element
        }
        
        element.selectedLength = 1
        element.selectedText = nil

        return element
    }
            
}
