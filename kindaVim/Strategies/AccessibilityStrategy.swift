import Foundation

protocol AccessibilityStrategyProtocol {
    
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func blockCursor(_ status: BlockCursorStatus, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    
    static func dump(element: AccessibilityTextElement?)
}

enum BlockCursorStatus {
    case on
    case off
}

struct AccessibilityStrategy: AccessibilityStrategyProtocol {

    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if element.isNotEmpty(), element.caretIsAtTheEnd(), element.lastCharacterIsNotLinefeed() {
            element.axCaretLocation -= 1

            return element
        }

        if element.isNotEmpty(), let startLimit = element.currentLine.startLimit(), element.axCaretLocation > startLimit {
            element.axCaretLocation -= 1
        }

        return element
    }
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.axRole == .textArea else { return nil }

        if let currentLineNumber = element.currentLine.number, let nextLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: currentLineNumber + 1) {
            if nextLine.isLastLine(), nextLine.isOnlyALinefeedCharacter() {
                let globalColumNumber = AccessibilityTextElement.globalColumnNumber
                element.axCaretLocation = element.axValue.count
                AccessibilityTextElement.globalColumnNumber = globalColumNumber
            } else {
                if let nextLineLength = nextLine.length, nextLineLength > AccessibilityTextElement.globalColumnNumber {
                    element.axCaretLocation = nextLine.start! + AccessibilityTextElement.globalColumnNumber - 1
                    AccessibilityTextElement.globalColumnNumber = element.axCaretLocation - nextLine.start! + 1
                } else {
                    if let endLimit = nextLine.endLimit() {
                        let globalColumNumber = AccessibilityTextElement.globalColumnNumber
                        element.axCaretLocation = endLimit
                        AccessibilityTextElement.globalColumnNumber = globalColumNumber
                    }
                }
            }
        }
                
        return element
    }
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.axRole == .textArea else { return nil }

        var previousLine: AccessibilityTextElementLine?

        if element.currentLine.isLastLine() {
            previousLine = AccessibilityTextElementAdaptor.lineFor(location: element.axCaretLocation - 1)
        } else {
            previousLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number! - 1)
        }

        if let previousLine = previousLine {
            if let previousLineLength = previousLine.length, previousLineLength > AccessibilityTextElement.globalColumnNumber {
                element.axCaretLocation = previousLine.start! + AccessibilityTextElement.globalColumnNumber - 1
                AccessibilityTextElement.globalColumnNumber = element.axCaretLocation - previousLine.start! + 1
            } else {
                if let endLimit = previousLine.endLimit() {
                    let globalColumnNumber = AccessibilityTextElement.globalColumnNumber
                    element.axCaretLocation = endLimit
                    AccessibilityTextElement.globalColumnNumber = globalColumnNumber
                }
            }
        }

        return element
    }

    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if let endLimit = element.currentLine.endLimit(), element.axCaretLocation < endLimit {
            element.axCaretLocation += 1
        }

        return element
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if let endLimit = element.currentLine.endLimit() {
            element.axCaretLocation = endLimit
        } else {
            if element.lastCharacterIsNotLinefeed() {
                element.axCaretLocation -= 1
            }
        }

        return element
    }

    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if let startLimit = element.currentLine.startLimit() {
            element.axCaretLocation = startLimit
        }

        return element
    }

    func blockCursor(_ status: BlockCursorStatus, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        switch status {
        case .on:
            element = h(on: element)!
            element.axSelectedLength = 0
        case .off:
            element.axSelectedLength = 0
        }

        return element
    }
    
    static func dump(element: AccessibilityTextElement?) {
        print("\ncaret position: \(String(describing: element?.axCaretLocation))")
        print("line start: \(String(describing: element?.currentLine.start))", "line end: \(String(describing: element?.currentLine.end))")
    }

    static func focusedElement() -> AccessibilityTextElement? {
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
    static func push(element: AccessibilityTextElement) -> Bool {
        print("move using Accessibility Stragety")

        return AccessibilityTextElementAdaptor.toAXFocusedElememt(from: element)
    }

}
