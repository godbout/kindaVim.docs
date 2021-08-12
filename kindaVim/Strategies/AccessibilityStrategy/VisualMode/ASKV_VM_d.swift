extension AccessibilityStrategyVisualMode {
    
    func d(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if KindaVimEngine.shared.visualStyle == .characterwise {
            return theMoveForVisualModeCharacterwise(on: element)
        }
        
        if KindaVimEngine.shared.visualStyle == .linewise {
            return theMoveForVisualModeLinewise(on: element)
        }
        
        return element
    }
    
    private func theMoveForVisualModeCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var newElement = element
        
        newElement.selectedText = ""
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
        guard let updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else { return nil }
        
        if updatedElement.caretLocation > updatedElement.currentLine.endLimit {            
            newElement.caretLocation -= Character.linefeedCharacterLength
        }

        newElement.selectedLength = 0
        newElement.selectedText = nil        
        
        return newElement
    }
    
    private func theMoveForVisualModeLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var newElement = element
        
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
            
            newElement.selectedText = ""
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
            
            newElement.caretLocation += firstNonBlankWithinLineLimitOflineAfterSelectionLocation
            newElement.selectedLength = 0
            newElement.selectedText = nil
            
            return newElement
        }
        
        if let lineAtBeginningOfSelection = lineAtBeginningOfSelection, let lineBeforeSelection = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineAtBeginningOfSelection.number - 1) {
            let firstNonBlankWithinLineLimitOflineBeforeSelectionLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lineBeforeSelection.value))
            
            newElement.caretLocation -= Character.linefeedCharacterLength
            newElement.selectedLength += Character.linefeedCharacterLength
            newElement.selectedText = ""
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: newElement)
            
            newElement.caretLocation -= lineBeforeSelection.lengthWithoutLinefeed - firstNonBlankWithinLineLimitOflineBeforeSelectionLocation                
            newElement.selectedLength = 0
            newElement.selectedText = ""
            
            return newElement
        } 
            
        newElement.selectedLength = element.length
        newElement.selectedText = ""        
        
        return newElement
    }
    
}
