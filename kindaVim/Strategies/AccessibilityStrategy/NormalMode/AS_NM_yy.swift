import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yy(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        var newElement = element
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(element.currentLine.value, forType: .string)
        
        newElement.selectedLength = element.characterLength
        newElement.selectedText = nil
        
        return newElement
    }
    
}
