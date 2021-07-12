extension AccessibilityStrategyNormalMode {
    
    func dF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(for: element) {
            return oneOfTheThreeCasesTM
        }
        
        return theMove(to: character, on: element)
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
    
    private func theMove(to character: Character, on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if let elementFound = F(to: character, on: element), elementFound.caretLocation != element.caretLocation  {
            element.selectedLength = element.caretLocation - elementFound.caretLocation
            element.caretLocation = elementFound.caretLocation
            element.selectedText = ""
            
            return element
        }
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element      
    }
    
}
