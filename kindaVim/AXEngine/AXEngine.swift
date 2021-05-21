import Foundation

struct AXEngine {

    static func axFocusedElement() -> AXUIElement? {
        let axSystemWideElement = AXUIElementCreateSystemWide()

        var axFocusedElement: AnyObject?
        guard AXUIElementCopyAttributeValue(axSystemWideElement, kAXFocusedUIElementAttribute as CFString, &axFocusedElement) == .success else { return nil }

        return axFocusedElement as! AXUIElement?
    }

    static func axLineNumber(at location: Int) -> Int? {
        if let axFocusedElement = AXEngine.axFocusedElement() {
            var currentLine: AnyObject?
            var error = AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXLineForIndexParameterizedAttribute as CFString, location as CFTypeRef, &currentLine)

            if error == .success {
                return (currentLine as! Int)
            } else {
                error = AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXLineForIndexParameterizedAttribute as CFString, location - 1 as CFTypeRef, &currentLine)

                if error == .success {
                    return (currentLine as! Int)
                }
            }
        }

        return nil
    }

    static func axLineNumber(at location: Int, for element: AccessibilityTextElement) -> Int? {
        if let axFocusedElement = AXEngine.axFocusedElement() {
            var index = location

            if location == element.internalText.count {
                index = location - 1
            }

            var currentLine: AnyObject?
            let error = AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXLineForIndexParameterizedAttribute as CFString, index as CFTypeRef, &currentLine)

            if error == .success {
                return (currentLine as! Int)
            }
        }

        return nil
    }

    static func axLineRangeFor(line: Int) -> CFRange? {
        if let axFocusedElement = AXEngine.axFocusedElement() {
            var lineRangeValue: AnyObject?
            let error = AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXRangeForLineParameterizedAttribute as CFString, line as CFTypeRef, &lineRangeValue)

            if error == .success {
                var lineRange = CFRange()
                AXValueGetValue(lineRangeValue as! AXValue, .cfRange, &lineRange)

                return lineRange
            }
        }

        return nil
    }

    static func fromAXFocusedElement() -> AccessibilityTextElement? {
        var accessibilityElement: AccessibilityTextElement?

        if let axFocusedElement = axFocusedElement() {
            var values: CFArray?
            let error = AXUIElementCopyMultipleAttributeValues(axFocusedElement, [kAXValueAttribute, kAXSelectedTextRangeAttribute, kAXNumberOfCharactersAttribute] as CFArray, .stopOnError, &values)

            if error == .success, let values = values as NSArray? {
                let text = values[0] as! String
                let numberOfCharacters = values[2] as! Int

                var selectedTextRange = CFRange()
                AXValueGetValue(values[1] as! AXValue, .cfRange, &selectedTextRange)

                let lineRange = CFRange()
                //self.lineRange(for: axFocusedElement, at: selectedTextRange.location, having: numberOfCharacters)

                //                print(selectedTextRange.location)

                accessibilityElement = AccessibilityTextElement(
                    internalText: text,
                    caretLocation: selectedTextRange.location,
                    lineStart: lineRange.location,
                    lineEnd: lineRange.location + lineRange.length
                )
            }
        }

        return accessibilityElement
    }

}
