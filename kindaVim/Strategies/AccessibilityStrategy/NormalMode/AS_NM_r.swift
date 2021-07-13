extension AccessibilityStrategyNormalMode {
    
    func r(with replacement: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        let value = element.value
        
        guard !value.isEmpty else { return element }                        
        guard let characterUnderCaretIndex = value.index(value.startIndex, offsetBy: element.caretLocation, limitedBy: value.index(before: value.endIndex)) else { return element }
        let characterUnderCaretText = element.value[characterUnderCaretIndex]
        
        guard characterUnderCaretText != "\n" else {
            element.selectedLength = 1
            element.selectedText = nil
            
            return element            
        }
        
        guard replacement != "\u{1b}" else {
            element.selectedLength = 1
            element.selectedText = nil
            
            return element            
        }            
        
        element.selectedLength = 1
        element.selectedText = replacement.isNewline ? "\n" : String(replacement)
        
        return element
    }
   
}
