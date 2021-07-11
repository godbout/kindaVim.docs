extension AccessibilityStrategyVisualMode {
    
    func d(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if let oneOfTheThreeCasesTM = handleTheThreeCasesTM(for: element) {
            return oneOfTheThreeCasesTM
        }
        
        if VimEngine.shared.visualStyle == .characterwise {
            return theMoveForVisualModeCharacterwise(on: element)
        }
        
        if VimEngine.shared.visualStyle == .linewise {
            return theMoveForVisualModeLinewise(on: element)
        }
        
        return element
    }
    
    private func handleTheThreeCasesTM(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 1
            element.selectedText = ""
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)            
            guard var updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else { return nil }
            
            updatedElement.caretLocation -= 1
            updatedElement.selectedText = nil
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: updatedElement)
            guard var finalElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else { return nil }
            
            let firstNonBlankWithinLimitOfLastLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: finalElement.currentLine.value))            
            finalElement.caretLocation = finalElement.currentLine.start + firstNonBlankWithinLimitOfLastLineLocation
            finalElement.selectedLength = 0
            finalElement.selectedText = nil
            
            return finalElement
        }
        
        
        return nil
    }
        
    private func theMoveForVisualModeCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        element.selectedText = ""
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
        guard let updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else { return nil }
        
        if updatedElement.caretLocation > updatedElement.currentLine.endLimit {            
            element.caretLocation -= 1             
        }

        element.selectedLength = 0
        element.selectedText = nil        
        
        return element
    }
    
    private func theMoveForVisualModeLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        var lineAtEndOfSelection: AccessibilityTextElementLine?
        var lineAtBeginningOfSelection: AccessibilityTextElementLine?
        
        if Self.head > Self.anchor {
            lineAtEndOfSelection = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head)
            lineAtBeginningOfSelection = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.anchor)
        } else if Self.anchor > Self.head {
            lineAtEndOfSelection = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.anchor)
            lineAtBeginningOfSelection = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head)
        }
        
        if let lineAtEndOfSelection = lineAtEndOfSelection, let lineAfterSelection = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineAtEndOfSelection.number + 1) {
            let firstNonBlankWithinLineLimitOflineAfterSelectionLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lineAfterSelection.value))
            
            element.selectedText = ""
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
            
            element.caretLocation += firstNonBlankWithinLineLimitOflineAfterSelectionLocation
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if let lineAtBeginningOfSelection = lineAtBeginningOfSelection, let lineBeforeSelection = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineAtBeginningOfSelection.number - 1) {
            let firstNonBlankWithinLineLimitOflineBeforeSelectionLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lineBeforeSelection.value))
            
            element.caretLocation -= 1
            element.selectedLength += 1
            element.selectedText = ""
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
            
            element.caretLocation -= lineBeforeSelection.length - firstNonBlankWithinLineLimitOflineBeforeSelectionLocation - 1                
            element.selectedLength = 0
            element.selectedText = ""
            
            return element
        } 
            
        element.selectedLength = element.length
        element.selectedText = ""        
        
        return element
    }
    
}
