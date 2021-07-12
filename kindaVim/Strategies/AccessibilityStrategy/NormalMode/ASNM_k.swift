extension AccessibilityStrategyNormalMode {
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        guard element.role == .textArea else { return nil }
        
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(for: element) {
            return oneOfTheThreeCasesTM
        }
        
        return theMove(on: element)
    }
    
    private func handleTheThreeCasesTM(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            element.selectedLength = 1
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
        
        var previousLine: AccessibilityTextElementLine?
        
        if element.caretIsAtTheEnd {
            previousLine = AccessibilityTextElementAdaptor.lineFor(location: element.caretLocation - 1)
        } else {
            previousLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number - 1)
        }
        
        if let previousLine = previousLine {
            if previousLine.length > AccessibilityTextElement.globalColumnNumber {
                element.caretLocation = previousLine.start + AccessibilityTextElement.globalColumnNumber - 1
            } else {
                let globalColumnNumber = AccessibilityTextElement.globalColumnNumber
                element.caretLocation = previousLine.endLimit
                AccessibilityTextElement.globalColumnNumber = globalColumnNumber
            }
        }
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
