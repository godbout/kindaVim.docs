import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yF(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        if let elementFound = F(to: character, on: element), elementFound.caretLocation != element.caretLocation {
            let text = element.value
            let caretLocationIndex = text.utf16.index(text.startIndex, offsetBy: element.caretLocation)
            let elementFoundCaretLocationIndex = text.utf16.index(text.startIndex, offsetBy: elementFound.caretLocation)
            
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(String(text[elementFoundCaretLocationIndex...caretLocationIndex]), forType: .string)
            
            newElement.caretLocation = elementFound.caretLocation
            newElement.selectedLength = newElement.characterLength
            newElement.selectedText = nil
            
            return newElement
        }
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
