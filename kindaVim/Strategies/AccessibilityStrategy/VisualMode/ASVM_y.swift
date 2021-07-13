import AppKit

extension AccessibilityStrategyVisualMode {
    
    func y(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        if let selectedText = element.selectedText {
            NSPasteboard.general.clearContents()
            NSPasteboard.general.setString(selectedText, forType: .string)
        }
        
        if VimEngine.shared.visualStyle == .characterwise {
            VimEngine.shared.lastYankStyle = .characterwise
        } else {
            VimEngine.shared.lastYankStyle = .linewise
        }
        
        element.selectedLength = 1     
        element.selectedText = nil
        
        return element
    }
    
}
