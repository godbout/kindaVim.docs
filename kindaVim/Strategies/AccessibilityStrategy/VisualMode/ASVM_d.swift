extension AccessibilityStrategyVisualMode {
    
    func d(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        
        if element.isEmpty {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.caretLocation -= 1
            element.selectedLength = 0
            
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
            if Self.head > Self.anchor {
                if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head), let lineAfterSelection = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineAtHead.number + 1) {
                    let firstNonBlankWithinLineLimitOflineAfterSelectionLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lineAfterSelection.value))
                
                    element.selectedText = ""
                    
                    _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
                    
                    element.caretLocation += firstNonBlankWithinLineLimitOflineAfterSelectionLocation
                    element.selectedLength = 0
                    element.selectedText = nil
                } else if let lineAtAnchor = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.anchor), let lineBeforeSelection = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineAtAnchor.number - 1) {
                    let firstNonBlankWithinLineLimitOflineBeforeSelectionLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lineBeforeSelection.value))
                    
                    element.caretLocation -= 1
                    element.selectedLength += 1
                    element.selectedText = ""
                    
                    _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
                    
                    element.caretLocation -= lineBeforeSelection.length - firstNonBlankWithinLineLimitOflineBeforeSelectionLocation - 1                
                    element.selectedLength = 0
                    element.selectedText = ""
                }
            } else if Self.anchor > Self.head {
                if let lineAtAnchor = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.anchor), let lineAfterSelection = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineAtAnchor.number + 1) {
                    let firstNonBlankWithinLineLimitOflineAfterSelectionLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lineAfterSelection.value))
                    
                    element.selectedText = ""
                    
                    _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
                    
                    element.caretLocation += firstNonBlankWithinLineLimitOflineAfterSelectionLocation
                    element.selectedLength = 0
                    element.selectedText = nil
                } else if let lineAtHead = AccessibilityTextElementAdaptor.lineFor(location: AccessibilityStrategyVisualMode.head), let lineBeforeSelection = AccessibilityTextElementAdaptor.lineFor(lineNumber: lineAtHead.number - 1) {
                    let firstNonBlankWithinLineLimitOflineBeforeSelectionLocation = textEngine.firstNonBlankWithinLineLimit(in: TextEngineLine(from: lineBeforeSelection.value))
                    
                    element.caretLocation -= 1
                    element.selectedLength += 1
                    element.selectedText = ""
                    
                    _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
                    
                    element.caretLocation -= lineBeforeSelection.length - firstNonBlankWithinLineLimitOflineBeforeSelectionLocation - 1                
                    element.selectedLength = 0
                    element.selectedText = ""
                }
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
