import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yt(to character: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        if let elementFound = t(to: character, on: element), elementFound.caretLocation != element.caretLocation {
            let text = element.value
            let caretLocationIndex = text.utf16.index(text.startIndex, offsetBy: element.caretLocation)
            let elementFoundCaretLocationIndex = text.utf16.index(text.startIndex, offsetBy: elementFound.caretLocation)
            
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(String(text[caretLocationIndex...elementFoundCaretLocationIndex]), forType: .string)
        }
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
