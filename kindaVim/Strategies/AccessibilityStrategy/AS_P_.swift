import AppKit

extension AccessibilityStrategy {
    
    func P(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if element.role == .textField {
            return PForTextFields(on: element)
        }
        
        if element.role == .textArea {
            return PForTextAreas(on: element)
        }
                
        return element         
    }
    
    private func PForTextFields(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if element.isEmpty {
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        
        var textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")        
        textToPaste.removeTrailingLinefeedIfAny()        
        element.selectedText = textToPaste.value
        
        return element
    }
    
    private func PForTextAreas(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        let element = element
        
        if VimEngine.shared.lastYankStyle == .characterwise {
            return PForTextAreasCharacterwise(on: element)
        }
        
        if VimEngine.shared.lastYankStyle == .linewise {
            return PForTextAreasLinewise(on: element)
        }
        
        return element
    }
    
    private func PForTextAreasCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if element.isEmpty {
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
                
        element.selectedText = NSPasteboard.general.string(forType: .string)
        
        return element
    }
    
    private func PForTextAreasLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        if element.isEmpty {
            var textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")
            textToPaste.addTrailingLinefeedIfNone()
            
            element.selectedText = textToPaste.value
            
            _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
            
            element.caretLocation += 1 + textEngine.firstNonBlank(in: textToPaste.value)
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            var textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")
            textToPaste.addTrailingLinefeedIfNone()
            
            element.selectedText = textToPaste.value
            
            _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
            
            element.caretLocation += 1 + textEngine.firstNonBlank(in: textToPaste.value)
            element.selectedText = nil
            
            return element
        }
        
        
        var textToPaste: TextEngineLine
        textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")
        textToPaste.addTrailingLinefeedIfNone()            
        
        element.caretLocation = element.currentLine.start!
        element.selectedLength = 0
        element.selectedText = textToPaste.value
        
        _ = AccessibilityTextElementAdaptor.toAXfocusedElement(from: element)
        
        element.caretLocation = element.currentLine.start! + 1 + textEngine.firstNonBlank(in: textToPaste.value)
        element.selectedText = nil
        
        return element    
    }
    
}
