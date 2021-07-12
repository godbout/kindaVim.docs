extension AccessibilityStrategyNormalMode {
    
    func r(with replacement: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(for: element) {
            return oneOfTheThreeCasesTM
        }
        
        return theMove(with: replacement, on: element)
    }
    
    private func handleTheThreeCasesTM(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        
        return nil
    }
    
    private func theMove(with replacement: Character, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        let characterUnderCaretIndex = element.value.index(element.value.startIndex, offsetBy: element.caretLocation)
        let characterUnderCaretText = element.value[characterUnderCaretIndex]
        guard characterUnderCaretText != "\n" else { return element }
        
        guard replacement != "\u{1b}" else { return element }            
        
        element.selectedLength = 1
        element.selectedText = replacement.isNewline ? "\n" : String(replacement)
        
        return element
    }
   
}
