extension AccessibilityStrategyNormalMode {
    
    func dj(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
    
    private func theMove(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if let nextLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number + 1) {
            element.caretLocation = element.currentLine.start
            element.selectedLength = element.currentLine.length + nextLine.length
            element.selectedText = ""
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
            
            if let updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() {            
                let firstNonBlankWithinLineLimitOfUpdatedElementLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: updatedElement.currentLine.value))
                
                element.caretLocation += firstNonBlankWithinLineLimitOfUpdatedElementLocation
            }
            
            element.selectedLength = 1
            element.selectedText = nil
            
            return element
        }    

        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
