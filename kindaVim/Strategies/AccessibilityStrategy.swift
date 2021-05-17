import Foundation

protocol AccessibilityStrategyProtocol {
    
    func h(on element: AccessibilityElement?) -> AccessibilityElement?
    func l(on element: AccessibilityElement?) -> AccessibilityElement?

}

struct AccessibilityStrategy: AccessibilityStrategyProtocol {

    func h(on element: AccessibilityElement?) -> AccessibilityElement? {
        guard var element = element else { return nil }

        if element.caretLocation > element.lineStart {
            element.caretLocation -= 1
        }
        
        return element
    }
    
    func l(on element: AccessibilityElement?) -> AccessibilityElement? {
        guard var element = element else { return nil }
        
        element.caretLocation += 1

        return element
    }

    static func focusedElement() -> AccessibilityElement? {
        return AccessibilityElementAdaptor.fromAXFocusedElement()
    }
    
    static func write(element: AccessibilityElement) -> Bool {
        print("move using Accessibility Stragety")

        return AccessibilityElementAdaptor.toAXFocusedElememt(from: element)
    }
    
}
