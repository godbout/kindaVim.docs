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
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)            
            guard var updatedElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else { return nil }
            
            updatedElement.caretLocation -= 1
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: updatedElement)
            guard var finalElement = AccessibilityTextElementAdaptor.fromAXFocusedElement() else { return nil }
            
            let firstNonBlankWithinLimitOfLastLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: finalElement.currentLine.value))            
            finalElement.caretLocation = finalElement.currentLine.start + firstNonBlankWithinLimitOfLastLineLocation
            finalElement.selectedLength = 0
            
            return finalElement
        }
        
        
        if VimEngine.shared.visualStyle == .linewise {
            if let nextLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number + 1) {
                let firstNonBlankWithinLineLimitOfNextLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: nextLine.value))
            
                element.selectedText = ""
                
                _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
                
                element.caretLocation += firstNonBlankWithinLineLimitOfNextLineLocation
                element.selectedLength = 0
                element.selectedText = nil
            } else if let previousLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number - 1) {
                let firstNonBlankWithinLineLimitOfPreviousLineLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: previousLine.value))
                
                element.caretLocation = element.currentLine.start - 1
                element.selectedLength = element.currentLine.length + 1
                element.selectedText = ""
                
                _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
                
                element.caretLocation -= previousLine.length - firstNonBlankWithinLineLimitOfPreviousLineLocation - 1                
                element.selectedLength = 0
                element.selectedText = ""
            }
        } else if VimEngine.shared.visualStyle == .characterwise {
            element.selectedText = ""
            
            if Self.head >= element.currentLine.endLimit, element.caretLocation > element.currentLine.start {
                _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
                
                element.caretLocation = element.currentLine.endLimit - 1
                element.selectedLength = 0
                element.selectedText = nil
            }            
        }
        
        return element
    }
    
}
