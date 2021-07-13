import AppKit

extension AccessibilityStrategyNormalMode {
    
    func yy(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        NSPasteboard.general.clearContents()
        NSPasteboard.general.setString(element.currentLine.value, forType: .string)
        
        element.selectedLength = 1
        element.selectedText = nil
        
        return element
    }
    
}
