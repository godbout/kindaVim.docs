import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yT(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if let elementFound = T(to: character, on: element), elementFound.caretLocation != element.caretLocation {
            let text = element.value
            let caretLocationIndex = text.index(text.startIndex, offsetBy: element.caretLocation)
            let elementFoundCaretLocationIndex = text.index(text.startIndex, offsetBy: elementFound.caretLocation)
            
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(String(text[elementFoundCaretLocationIndex..<caretLocationIndex]), forType: .string)
            
            element.caretLocation = elementFound.caretLocation
        }
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}

