import Foundation

protocol AccessibilityStrategyProtocol {
    
    func h(on element: AccessibilityElement?) -> AccessibilityElement?
    func l(on element: AccessibilityElement?) -> AccessibilityElement?
    
}

struct AccessibilityStrategy: AccessibilityStrategyProtocol {
    
    static var currentAxFocusedElement: AXUIElement?
    
    func h(on element: AccessibilityElement?) -> AccessibilityElement? {
        guard var element = element else { return nil }
        
        element.cursorLocation -= 1
        
        return element
    }
    
    func l(on element: AccessibilityElement?) -> AccessibilityElement? {
        guard var element = element else { return nil }
        
        element.cursorLocation += 1
        
        return element
    }
    
    static func focusedElement() -> AccessibilityElement? {
        var accessibilityElement: AccessibilityElement?
        let axSystemWideElement = AXUIElementCreateSystemWide()
        
        var axFocusedElement: AnyObject?
        var error = AXUIElementCopyAttributeValue(axSystemWideElement, kAXFocusedUIElementAttribute as CFString, &axFocusedElement)
        
        if error == .success {
            currentAxFocusedElement = (axFocusedElement as! AXUIElement)
            
            var value: AnyObject?
            error = AXUIElementCopyAttributeValue(axFocusedElement as! AXUIElement, kAXSelectedTextRangeAttribute as CFString, &value)
    
            if error == .success {
                var range = CFRange()
            
                if (AXValueGetValue(value as! AXValue, AXValueType.cfRange, &range)) {
                    accessibilityElement = AccessibilityElement(
                        cursorLocation: range.location
                    )
                }
            }
            
        }
            
        return accessibilityElement
    }
    
    static func write(element: AccessibilityElement) -> Bool {
        print("move using Accessibility Stragety")

        var range = CFRange(
            location: element.cursorLocation,
            length: 0
        )
                                
        let newValue = AXValueCreate(AXValueType.cfRange, &range)
        
        guard let focusedElement = currentAxFocusedElement else { return false }
    
        AXUIElementSetAttributeValue(focusedElement, kAXSelectedTextRangeAttribute as CFString, newValue!)
        
        return true
    }
    
}
