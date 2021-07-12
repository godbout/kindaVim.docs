extension AccessibilityStrategyNormalMode {
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
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
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 1
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
            if nextLine.isTheLastLine, nextLine.isAnEmptyLine {
                let globalColumNumber = AccessibilityTextElement.globalColumnNumber
                element.caretLocation = element.length
                AccessibilityTextElement.globalColumnNumber = globalColumNumber
            } else {
                if nextLine.length > AccessibilityTextElement.globalColumnNumber {
                    element.caretLocation = nextLine.start + AccessibilityTextElement.globalColumnNumber - 1
                } else {
                    let globalColumNumber = AccessibilityTextElement.globalColumnNumber
                    element.caretLocation = nextLine.endLimit
                    AccessibilityTextElement.globalColumnNumber = globalColumNumber
                }
            }
        } else if element.currentLine.isNotTheLastLine {
            element.caretLocation = element.length
        }
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
