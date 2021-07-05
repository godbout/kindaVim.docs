import AppKit

extension AccessibilityStrategyNormalMode {
    
    func p(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard let element = element else { return nil }
        
        if element.role == .textField {
            return pForTextFields(on: element)
        }
        
        if element.role == .textArea {
            return pForTextAreas(on: element)
        }        
        
        return element         
    }
    
    private func pForTextFields(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        element.selectedLength = 0
        
        
        if element.isEmpty {
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            var textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")
            textToPaste.removeTrailingLinefeedIfAny()     
            element.selectedText = textToPaste.value
            
            return element            
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {}
        
                
        var textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")
        textToPaste.removeTrailingLinefeedIfAny()
        element.caretLocation += 1     
        element.selectedText = textToPaste.value
                    
        return element
    }
    
    private func pForTextAreas(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        let element = element
        
        if VimEngine.shared.lastYankStyle == .characterwise {
            return pForTextAreasCharacterwise(on: element)
        }
        
        if VimEngine.shared.lastYankStyle == .linewise {
            return pForTextAreasLinewise(on: element)
        }
        
        return element
    }
    
    private func pForTextAreasCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        element.selectedLength = 0
        
        
        if element.isEmpty {
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element            
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
        
        if element.currentLine.isNotAnEmptyLine {
            element.caretLocation += 1
        }
        
        element.selectedText = NSPasteboard.general.string(forType: .string)
        
        return element
    }
    
    private func pForTextAreasLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        element.selectedLength = 0
        
        
        if element.isEmpty {        
            var textToPaste = TextEngineLine(from: "\n" + (NSPasteboard.general.string(forType: .string) ?? ""))
            textToPaste.removeTrailingLinefeedIfAny()
            
            element.selectedText = textToPaste.value 
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
            
            element.caretLocation += 1 + textEngine.firstNonBlank(in: textToPaste.value)
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {}
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            var textToPaste = TextEngineLine(from: "\n" + (NSPasteboard.general.string(forType: .string) ?? ""))
            textToPaste.removeTrailingLinefeedIfAny()
            
            element.selectedText = textToPaste.value
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
            
            element.caretLocation += 1 + textEngine.firstNonBlank(in: textToPaste.value)
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        
        var textToPaste: TextEngineLine
           
        if element.currentLine.isTheLastLine {
            textToPaste = TextEngineLine(from: "\n" + (NSPasteboard.general.string(forType: .string) ?? ""))
            textToPaste.removeTrailingLinefeedIfAny()
        } else {
            textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")
            textToPaste.addTrailingLinefeedIfNone()            
        }
        
        element.caretLocation = element.currentLine.end
        element.selectedText = textToPaste.value
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
        
        element.caretLocation += 1 + textEngine.firstNonBlank(in: textToPaste.value)
        element.selectedLength = 0
        element.selectedText = nil
        
        return element    
    }
    
}
