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
        let element = element
        
        if let oneOfTheThreeCasesTMForTextFields = handleTheThreeCasesTMForTextFields(for: element) {
            return oneOfTheThreeCasesTMForTextFields
        }
        
        return theMoveForTextFields(on: element)
    }
    
    private func handleTheThreeCasesTMForTextFields(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            element.selectedLength = 0
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            var textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")
            textToPaste.removeTrailingLinefeedIfAny()     
            
            element.selectedLength = 0
            element.selectedText = textToPaste.value
            
            return element            
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            return theMoveForTextFields(on: element)
        }
        
        
        return nil
    }
    
    private func theMoveForTextFields(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        var textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")
        textToPaste.removeTrailingLinefeedIfAny()
        
        element.caretLocation += 1     
        element.selectedLength = 0
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
        let element = element
        
        if let oneOfTheThreeCasesTMForTextAreasCharacterwise = handleTheThreeCasesTMForTextAreasCharacterwise(for: element) {
            return oneOfTheThreeCasesTMForTextAreasCharacterwise
        }
        
        return theMoveForTextAreasCharacterwise(on: element)
    }
    
    private func handleTheThreeCasesTMForTextAreasCharacterwise(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {
            element.selectedLength = 0
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            element.selectedLength = 0
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element            
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            element.selectedLength = 0
            element.selectedText = NSPasteboard.general.string(forType: .string)
            
            return element
        }
        
        
        return nil
    }
    
    private func theMoveForTextAreasCharacterwise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        
        if element.currentLine.isNotAnEmptyLine {
            element.caretLocation += 1
        }
        
        element.selectedLength = 0
        element.selectedText = NSPasteboard.general.string(forType: .string)
        
        return element
    }    
    
    private func pForTextAreasLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        let element = element
        
        if let oneOfTheThreeCasesTMForTextAreasLinewise = handleTheThreeCasesTMForTextAreasLinewise(for: element) {
            return oneOfTheThreeCasesTMForTextAreasLinewise
        }
        
        return theMoveForTextAreasLinewise(on: element)
    }
    
    private func handleTheThreeCasesTMForTextAreasLinewise(for element: AccessibilityTextElement) -> AccessibilityTextElement? {
        var element = element
        
        
        if element.isEmpty {        
            var textToPaste = TextEngineLine(from: "\n" + (NSPasteboard.general.string(forType: .string) ?? ""))
            textToPaste.removeTrailingLinefeedIfAny()
            
            element.selectedLength = 0
            element.selectedText = textToPaste.value 
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
            
            element.caretLocation += 1 + textEngine.firstNonBlank(in: textToPaste.value)
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsNotLinefeed {
            return theMoveForTextAreasLinewise(on: element)
        }
        
        if element.caretIsAtTheEnd, element.lastCharacterIsLinefeed {
            var textToPaste = TextEngineLine(from: "\n" + (NSPasteboard.general.string(forType: .string) ?? ""))
            textToPaste.removeTrailingLinefeedIfAny()
            
            element.selectedLength = 0
            element.selectedText = textToPaste.value
            
            _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
            
            element.caretLocation += 1 + textEngine.firstNonBlank(in: textToPaste.value)
            element.selectedLength = 0
            element.selectedText = nil
            
            return element
        }
        
        
        return nil
    }
    
    private func theMoveForTextAreasLinewise(on element: AccessibilityTextElement) -> AccessibilityTextElement {
        var element = element
        
        var textToPaste: TextEngineLine
        
        if element.currentLine.isTheLastLine {
            textToPaste = TextEngineLine(from: "\n" + (NSPasteboard.general.string(forType: .string) ?? ""))
            textToPaste.removeTrailingLinefeedIfAny()
        } else {
            textToPaste = TextEngineLine(from: NSPasteboard.general.string(forType: .string) ?? "")
            textToPaste.addTrailingLinefeedIfNone()            
        }
        
        element.caretLocation = element.currentLine.end
        element.selectedLength = 0
        element.selectedText = textToPaste.value
        
        _ = AccessibilityTextElementAdaptor.toAXFocusedElement(from: element)
        
        element.caretLocation += 1 + textEngine.firstNonBlank(in: textToPaste.value)
        element.selectedLength = 0
        element.selectedText = nil
        
        return element    
    }
    
}
