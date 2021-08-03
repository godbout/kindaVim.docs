import Foundation


struct AXTextElementData {

    let role: AccessibilityTextElementRole
    let value: String
    let length: Int
    let caretLocation: Int
    let selectedLength: Int
    let selectedText: String
    
}


enum AXElementRole {
    
    case webArea
    case someOtherShit
    
}


struct AXEngine {

    static func axFocusedElement() -> AXUIElement? {
        let axSystemWideElement = AXUIElementCreateSystemWide()

        var axFocusedElement: AnyObject?
        guard AXUIElementCopyAttributeValue(axSystemWideElement, kAXFocusedUIElementAttribute as CFString, &axFocusedElement) == .success else { return nil }

        return axFocusedElement as! AXUIElement?
    }

    static func axLineNumberFor(location: Int, on axFocusedElement: AXUIElement? = axFocusedElement()) -> Int? {
        guard let axFocusedElement = axFocusedElement else { return nil }
        
        var currentLine: AnyObject?
        guard AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXLineForIndexParameterizedAttribute as CFString, location as CFTypeRef, &currentLine) == .success else { return nil }

        return (currentLine as! Int)
    }

    static func axLineRangeFor(lineNumber: Int, on axFocusedElement: AXUIElement? = axFocusedElement()) -> CFRange? {
        guard let axFocusedElement = axFocusedElement else { return nil }
        
        var lineRangeValue: AnyObject?
        guard AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXRangeForLineParameterizedAttribute as CFString, lineNumber as CFTypeRef, &lineRangeValue) == .success else { return nil }
        
        var lineRange = CFRange()
        AXValueGetValue(lineRangeValue as! AXValue, .cfRange, &lineRange)

        return lineRange
    }
    
    static func axRole(of axFocusedElement: AXUIElement? = axFocusedElement()) -> AXElementRole? {
        guard let axFocusedElement = axFocusedElement else { return nil }
        
        var role: AnyObject?
        let error = AXUIElementCopyAttributeValue(axFocusedElement, kAXRoleAttribute as CFString, &role)
        
        guard error == .success, let elementRole = role as? String else { return nil }
        
        switch (elementRole) {
        case "AXWebArea":
            return .webArea
        default:
            return .someOtherShit
        }
        
    }
    
    static func axTextElementData(of axFocusedElement: AXUIElement? = axFocusedElement()) -> AXTextElementData? { 
        guard let axFocusedElement = axFocusedElement else { return nil }
        
        var values: CFArray?
        let error = AXUIElementCopyMultipleAttributeValues(axFocusedElement, [kAXRoleAttribute, kAXValueAttribute, kAXNumberOfCharactersAttribute, kAXSelectedTextRangeAttribute, kAXSelectedTextAttribute] as CFArray, .stopOnError, &values)
        
        guard error == .success, let elementValues = values as NSArray? else { return nil }
        
        let axRole = role(for: elementValues[0] as! String)
        guard axRole != .someOtherShit else { return nil }
        
        var selectedTextRange = CFRange()
        AXValueGetValue(elementValues[3] as! AXValue, .cfRange, &selectedTextRange)
        
        let axValue = elementValues[1] as! String
        let axLength = elementValues[2] as! Int
        let axCaretLocation = selectedTextRange.location
        let axSelectedLength = selectedTextRange.length
        let axSelectedText = elementValues[4] as! String
        
        return AXTextElementData(
            role: axRole,
            value: axValue,
            length: axLength,
            caretLocation: axCaretLocation,
            selectedLength: axSelectedLength,
            selectedText: axSelectedText
        )
    }
    
    private static func role(for role: String) -> AccessibilityTextElementRole {
        switch role {
        case "AXTextField":
            return .textField
        case "AXTextArea":
            return .textArea
        default:
            return .someOtherShit
        }
    }
    
    static func axSelectedTextRange(on axFocusedElement: AXUIElement? = axFocusedElement()) -> CFRange? {
        guard let axFocusedElement = axFocusedElement else { return nil }
        
        var axSelectedTextRange: AnyObject?
        guard AXUIElementCopyAttributeValue(axFocusedElement, kAXSelectedTextRangeAttribute as CFString, &axSelectedTextRange) == .success else { return nil }
        
        var selectedTextRange = CFRange()
        AXValueGetValue(axSelectedTextRange as! AXValue, .cfRange, &selectedTextRange)
        
        return selectedTextRange
    }
    
    static func axValueAndNumberOfCharacters(of axFocusedElement: AXUIElement? = axFocusedElement()) -> (String, Int)? {
        guard let axFocusedElement = axFocusedElement else { return nil }
            
        var values: CFArray?
        let error = AXUIElementCopyMultipleAttributeValues(axFocusedElement, [kAXRoleAttribute, kAXValueAttribute, kAXNumberOfCharactersAttribute] as CFArray, .stopOnError, &values)
        
        guard error == .success, let elementValues = values as NSArray? else { return nil }
        
        guard role(for: elementValues[0] as! String) != .someOtherShit else { return nil }
        
        let axValue = elementValues[1] as! String
        let axLength = elementValues[2] as! Int
    
        return (axValue, axLength)
    }
    
    static func toAXFocusedElement(from accessibilityElement: AccessibilityTextElement) -> Bool {
        guard let axFocusedElement = axFocusedElement() else { return false }
        
        var selectedTextRange = CFRange()
        selectedTextRange.location = accessibilityElement.caretLocation
        selectedTextRange.length = tweakedSelectedLength(for: accessibilityElement)
        
        let newValue = AXValueCreate(.cfRange, &selectedTextRange)
        guard AXUIElementSetAttributeValue(axFocusedElement, kAXSelectedTextRangeAttribute as CFString, newValue!) == .success else { return false }
        
        if let selectedText = accessibilityElement.selectedText {
            guard AXUIElementSetAttributeValue(axFocusedElement, kAXSelectedTextAttribute as CFString, selectedText as CFTypeRef) == .success else { return false }
        }
        
        return true
    }
    
    // we don't need to take care anymore of the 1st and 3rd Cases in Normal Mode
    // as we now calculate the selectedLength dynamically thanks to the emojis.
    // we still need the tweak for the Visual Mode though because we can start the Visual Mode
    // at the last empty line, and we also need to come back to it. in that case we need to remove one character length
    // from the total length, as we can't force the block cursor on the last empty line.
    private static func tweakedSelectedLength(for element: AccessibilityTextElement) -> Int {
        if KindaVimEngine.shared.currentMode == .visual {
            guard element.caretLocation + element.selectedLength <= element.length else { return element.selectedLength - 1 }
        }
        
        return element.selectedLength
    }

}
