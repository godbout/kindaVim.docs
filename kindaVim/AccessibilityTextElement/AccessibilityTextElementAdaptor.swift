import Foundation

struct AccessibilityTextElementAdaptor {
    
    // TO THINK:
    // tried to keep a static variable to the last axFocusedElement
    // to avoid querying for it again when we write to it.
    // it makes sense while using the app because we will always
    // write to the field we currently are in. but it makes testing
    // harder to understand, as you need to reset the static variable in between.
    // not sure how to handle this yet. without a static variable, we have to requery,
    // which seems actually very fast. so maybe it's safer this way.
    static func fromAXFocusedElement() -> AccessibilityTextElement? {
        guard let axFocusedElement = AXEngine.axFocusedElement() else { return nil }

        var values: CFArray?
        let error = AXUIElementCopyMultipleAttributeValues(axFocusedElement, [kAXRoleAttribute, kAXValueAttribute, kAXNumberOfCharactersAttribute, kAXSelectedTextRangeAttribute] as CFArray, .stopOnError, &values)

        guard error == .success, let elementValues = values as NSArray? else { return nil }

        let axRole = role(for: elementValues[0] as! String)
        guard axRole != .someOtherShit else { return nil }
        
        var selectedTextRange = CFRange()
        AXValueGetValue(elementValues[3] as! AXValue, .cfRange, &selectedTextRange)

        let axValue = elementValues[1] as! String
        let axLength = elementValues[2] as! Int
        let axCaretLocation = selectedTextRange.location
        let axSelectedLength = selectedTextRange.length

        guard let currentLine = lineFor(location: axCaretLocation, on: axFocusedElement) else { return nil }

        return AccessibilityTextElement(
            role: axRole,
            value: axValue,
            length: axLength,
            caretLocation: axCaretLocation,
            selectedLength: axSelectedLength,
            currentLine: currentLine
        )
    }

    static func lineFor(location: Int, on axFocusedElement: AXUIElement? = AXEngine.axFocusedElement()) -> AccessibilityTextElementLine? {
        guard let axFocusedElement = axFocusedElement else { return nil }
        
        // we grab both the value and the length separately while we could grab the count from the value
        // but String.count needs to go through every single grapheme cluster which is not efficient. grabbing
        // the length once through the API, we can use it everywhere directly. this is much faster.
        guard let (elementValue, elementLength) = AXEngine.axValueAndNumberOfCharacters(of: axFocusedElement) else { return nil }
        

        if elementValue.isEmpty {
            return AccessibilityTextElementLine(
                fullValue: "",
                number: 1,
                start: 0,
                end: 0
            )
        }

        if caretIsAtTheEnd(for: location, with: elementLength), lastCharacterIsNotLinefeed(in: elementValue) {
            guard let axLineNumber = AXEngine.axLineNumberFor(location: location - 1, on: axFocusedElement) else { return nil }
            guard let axLineRange = AXEngine.axLineRangeFor(lineNumber: axLineNumber, on: axFocusedElement) else { return nil }

            return AccessibilityTextElementLine(
                fullValue: elementValue,
                number: axLineNumber + 1,
                start: axLineRange.location,
                end: axLineRange.location + axLineRange.length
            )
        }

        if caretIsAtTheEnd(for: location, with: elementLength), lastCharacterIsLinefeed(in: elementValue) {
            guard let axLineNumber = AXEngine.axLineNumberFor(location: location - 1, on: axFocusedElement) else { return nil }

            return AccessibilityTextElementLine(
                fullValue: elementValue,
                number: axLineNumber + 2,
                start: elementLength,
                end: elementLength
            )
        }
        
        
        var lineNumber: Int
        var lineRange: CFRange
                
        if #available(macOS 11.0, *) {
            guard let axLineNumber = AXEngine.axLineNumberFor(location: location, on: axFocusedElement) else { return nil }
            guard let axLineRange = AXEngine.axLineRangeFor(lineNumber: axLineNumber, on: axFocusedElement) else { return nil }
            guard let axSelectedTextRange = AXEngine.axSelectedTextRange(on: axFocusedElement) else { return nil }
            
            // if the AX API returns a location that is equal to the line end while the selectedLength is more than 0
            // then we're gonna hit the Big Sur bug and need to do some magic
            if location == axLineRange.location + axLineRange.length, axSelectedTextRange.length > 0  {
                guard let axLineNumber = AXEngine.axLineNumberFor(location: location + 1, on: axFocusedElement) else { return nil }
                guard let axLineRange = AXEngine.axLineRangeFor(lineNumber: axLineNumber, on: axFocusedElement) else { return nil }
                
                lineNumber = axLineNumber
                lineRange = axLineRange
            } else {
                lineNumber = axLineNumber
                lineRange = axLineRange
            }
        } else {
            guard let axLineNumber = AXEngine.axLineNumberFor(location: location, on: axFocusedElement) else { return nil }
            guard let axLineRange = AXEngine.axLineRangeFor(lineNumber: axLineNumber, on: axFocusedElement) else { return nil }
            
            lineNumber = axLineNumber
            lineRange = axLineRange
        }

        return AccessibilityTextElementLine(
            fullValue: elementValue,
            number: lineNumber + 1,
            start: lineRange.location,
            end: lineRange.location + lineRange.length
        )
    }

    private static func caretIsAtTheEnd(for location: Int, with length: Int) -> Bool {
        return location == length
    }

    private static func lastCharacterIsLinefeed(in text: String) -> Bool {
        return text.last == "\n"
    }

    private static func lastCharacterIsNotLinefeed(in text: String) -> Bool {
        return !lastCharacterIsLinefeed(in: text)
    }
    
    static func lineFor(lineNumber: Int, on axFocusedElement: AXUIElement? = AXEngine.axFocusedElement()) -> AccessibilityTextElementLine? {
        guard let axFocusedElement = axFocusedElement else { return nil }

        guard let (elementValue, _) = AXEngine.axValueAndNumberOfCharacters(of: axFocusedElement) else { return nil }
        

        if elementValue.isEmpty {
            return AccessibilityTextElementLine(
                fullValue: "",
                number: 1,
                start: 0,
                end: 0
            )
        }


        guard let axLineRange = AXEngine.axLineRangeFor(lineNumber: lineNumber - 1, on: axFocusedElement) else { return nil }

        return AccessibilityTextElementLine(
            fullValue: elementValue,
            number: lineNumber,
            start: axLineRange.location,
            end: axLineRange.location + axLineRange.length
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

    static func toAXfocusedElement(from accessibilityElement: AccessibilityTextElement) -> Bool {
        guard let axFocusedElement = AXEngine.axFocusedElement() else { return false }
        
        var selectedTextRange = CFRange()
        selectedTextRange.location = accessibilityElement.caretLocation
        selectedTextRange.length = accessibilityElement.selectedLength

        let newValue = AXValueCreate(.cfRange, &selectedTextRange)

        guard AXUIElementSetAttributeValue(axFocusedElement, kAXSelectedTextRangeAttribute as CFString, newValue!) == .success else { return false }
        
        if let selectedText = accessibilityElement.selectedText {
            guard AXUIElementSetAttributeValue(axFocusedElement, kAXSelectedTextAttribute as CFString, selectedText as CFTypeRef) == .success else { return false }
        }
        
        return true
    }

}
