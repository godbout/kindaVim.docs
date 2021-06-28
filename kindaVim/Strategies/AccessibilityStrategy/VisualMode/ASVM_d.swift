extension AccessibilityStrategyVisualMode {
    
    func d(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if element.isEmpty {
            return element
        }
        
        // this case is handled by v and V. before being able to use VM d
        // we need to enter Visual Mode with v or V, and those two moves
        // will move back one character if in the 2nd case of The 3 Cases
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 1
            element.selectedText = ""
            
            _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)            
            guard var updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else { return nil }
            
            updatedElement.caretLocation -= 1
            
            _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: updatedElement)
            guard var finalElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else { return nil }
            
            let firstNonBlankWithinLimitOfLastLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: finalElement.currentLine.value))            
            finalElement.caretLocation = finalElement.currentLine.start! + firstNonBlankWithinLimitOfLastLineLocation
            finalElement.selectedLength = 0
            
            return finalElement
        }
        
        
        if VimEngine.shared.visualStyle == .linewise {
            if let axNextLine = AXEngine.axLineRangeFor(lineNumber: element.currentLine.number! + 1) {
                let value = element.value
                let axNextLineText = String(value[value.index(value.startIndex, offsetBy: axNextLine.location)..<value.index(value.startIndex, offsetBy: axNextLine.location + axNextLine.length)])
                let firstNonBlankWithinLineLimitOfNextLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: axNextLineText))
            
                element.selectedText = ""
                
                _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
                
                element.caretLocation += firstNonBlankWithinLineLimitOfNextLineLocation
                element.selectedLength = 0
                element.selectedText = nil
            } else if let axPreviousLine = AXEngine.axLineRangeFor(lineNumber: element.currentLine.number! - 1) {
                let value = element.value
                let axPreviousLineText = String(value[value.index(value.startIndex, offsetBy: axPreviousLine.location)..<value.index(value.startIndex, offsetBy: axPreviousLine.location + axPreviousLine.length)])
                let firstNonBlankWithinLineLimitOfPreviousLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: axPreviousLineText))
                
                element.caretLocation = element.currentLine.start! - 1
                element.selectedLength = element.currentLine.length! + 1
                element.selectedText = ""
                
                _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
                
                element.caretLocation -= axPreviousLineText.count - firstNonBlankWithinLineLimitOfPreviousLineLocation - 1                
                element.selectedLength = 0
                element.selectedText = ""
            }
        } else {
            element.selectedText = ""
        }
        
        return element
    }
    
}
