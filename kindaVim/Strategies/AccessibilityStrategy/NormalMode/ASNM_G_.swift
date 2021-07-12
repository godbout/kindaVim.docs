extension AccessibilityStrategyNormalMode {
    
    func G(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
            element.selectedLength = 0
            element.selectedText = nil        
            
            return element
        }
        
        
        return nil
    }
    
    private func theMove(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if element.lastCharacterIsLinefeed {
            element.caretLocation = element.length
        } else if let lastLine = AccessibilityTextElementAdaptor.lineFor(location: element.length) {            
            element.caretLocation = lastLine.start + textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lastLine.value))
        }
        
        element.selectedLength = 1
        element.selectedText = nil                
                
        return element
    }
    
}
