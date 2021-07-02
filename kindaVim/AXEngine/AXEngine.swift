import Foundation

struct AXEngine {

    static func axFocusedElement() -> AXUIElement? {
        let axSystemWideElement = AXUIElementCreateSystemWide()

        var axFocusedElement: AnyObject?
        guard AXUIElementCopyAttributeValue(axSystemWideElement, kAXFocusedUIElementAttribute as CFString, &axFocusedElement) == .success else { return nil }

        return axFocusedElement as! AXUIElement?
    }

    static func axLineNumberFor(location: Int, on axFocusedElement: AXUIElement? = axFocusedElement()) -> Int? {
        if let axFocusedElement = axFocusedElement {
            var currentLine: AnyObject?
            let error = AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXLineForIndexParameterizedAttribute as CFString, location as CFTypeRef, &currentLine)

            if error == .success {
                return (currentLine as! Int)
            }
        }

        return nil
    }

    static func axLineRangeFor(lineNumber: Int, on axFocusedElement: AXUIElement? = axFocusedElement()) -> CFRange? {
        if let axFocusedElement = axFocusedElement {
            var lineRangeValue: AnyObject?
            let error = AXUIElementCopyParameterizedAttributeValue(axFocusedElement, kAXRangeForLineParameterizedAttribute as CFString, lineNumber as CFTypeRef, &lineRangeValue)

            if error == .success {
                var lineRange = CFRange()
                AXValueGetValue(lineRangeValue as! AXValue, .cfRange, &lineRange)

                return lineRange
            }
        }

        return nil
    }
    
    static func axSelectedTextRange(on axFocusedElement: AXUIElement? = axFocusedElement()) -> CFRange? {
        if let axFocusedElement = axFocusedElement {
            var axSelectedTextRange: AnyObject?
            let error = AXUIElementCopyAttributeValue(axFocusedElement, kAXSelectedTextRangeAttribute as CFString, &axSelectedTextRange)
            
            if error == .success {
                var selectedTextRange = CFRange()
                AXValueGetValue(axSelectedTextRange as! AXValue, .cfRange, &selectedTextRange)
                
                return selectedTextRange
            }
        }
        
        return nil
    }
    
    static func axValueAndNumberOfCharacters(of axFocusedElement: AXUIElement? = axFocusedElement()) -> (String, Int)? {
        guard let axFocusedElement = axFocusedElement else { return nil }
            
        var values: CFArray?
        let error = AXUIElementCopyMultipleAttributeValues(axFocusedElement, [kAXValueAttribute, kAXNumberOfCharactersAttribute] as CFArray, .stopOnError, &values)
        
        guard error == .success, let elementValues = values as NSArray? else { return nil }
        
        let axValue = elementValues[0] as! String
        let axLength = elementValues[1] as! Int
    
        return (axValue, axLength)
    }

}
