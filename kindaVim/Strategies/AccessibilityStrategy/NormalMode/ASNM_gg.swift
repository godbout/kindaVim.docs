extension AccessibilityStrategyNormalMode {
    
    func gg(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(for: element) {
            return oneOfTheThreeCasesTM
        }
        
        return theMove(on: element)
    }
    
    private func handleTheThreeCasesTM(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
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
        
        if let firstLine = AccessibilityTextElementAdaptor.lineFor(location: 0) {
            element.caretLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: firstLine.value))
        }
        
        element.selectedText = nil
        
        return element
    }
    
}
