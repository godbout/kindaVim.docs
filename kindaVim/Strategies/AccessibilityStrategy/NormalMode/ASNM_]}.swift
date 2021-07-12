extension AccessibilityStrategyNormalMode {
    
    func rightBracketRightBrace(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(for: element) {
            return oneOfTheThreeCasesTM
        }
        
        return theMove(on: element)
    }
    
    private func handleTheThreeCasesTM(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return theMove(on: element)
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return theMove(on: element)
        }
        
        
        return nil
    }
    
    private func theMove(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        element.caretLocation = textEngine.nextUnmatched("}", after: element.caretLocation, in: element.value)
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
