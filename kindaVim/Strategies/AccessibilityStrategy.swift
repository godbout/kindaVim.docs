import Foundation

protocol AccessibilityStrategyProtocol {

    func a(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func ciDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func f(characterToGoTo: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func t(characterToGoBefore: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func w(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    func blockCursor(_ status: BlockCursorStatus, on element: AccessibilityTextElement?) -> AccessibilityTextElement?
    
    static func test(element: AccessibilityTextElement?) -> AccessibilityTextElement?
}

enum BlockCursorStatus {
    case on
    case off
}

struct AccessibilityStrategy: AccessibilityStrategyProtocol {
    
    var textEngine: TextEngineProtocol = TextEngine()
    

    func a(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.value.count != 0 else { return element }
        guard element.currentLine.isOnlyALinefeedCharacter() != true else { return element }

        element.caretLocation += 1

        return element
    }
    
    func b(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        element.caretLocation = textEngine.wordBackward(for: element.caretLocation, playground: element.value)  
        
        return element
    }
    
    func ciDoubleQuote(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        let lineText = element.currentLine.value
        
        if let firstDoubleQuoteLocation = textEngine.findFirst("\"", in: lineText), let secondDoubleQuoteLocation = textEngine.findSecond("\"", in: lineText) {
            element.caretLocation = element.currentLine.start! + (firstDoubleQuoteLocation + 1)
            element.selectedLength = secondDoubleQuoteLocation - (firstDoubleQuoteLocation + 1)
            element.selectedText = ""
        }
        
        return element        
    }

    func f(characterToGoTo: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        let lineText = element.currentLine.value
        
        if let characterToGoToIndex = textEngine.findNext(characterToGoTo, after: element.caretLocation, in: lineText) {
            element.caretLocation = element.currentLine.start! + characterToGoToIndex            
        }

        return element
    }

    func h(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if element.isNotEmpty(), element.caretIsAtTheEnd(), element.lastCharacterIsNotLinefeed() {
            element.caretLocation -= 1

            return element
        }

        if element.isNotEmpty(), let startLimit = element.currentLine.startLimit(), element.caretLocation > startLimit {
            element.caretLocation -= 1
        }

        return element
    }
    
    func j(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.role == .textArea else { return nil }

        if let currentLineNumber = element.currentLine.number, let nextLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: currentLineNumber + 1) {
            if nextLine.isLastLine(), nextLine.isOnlyALinefeedCharacter() {
                let globalColumNumber = AccessibilityTextElement.globalColumnNumber
                element.caretLocation = element.value.count
                AccessibilityTextElement.globalColumnNumber = globalColumNumber
            } else {
                if let nextLineLength = nextLine.length, nextLineLength > AccessibilityTextElement.globalColumnNumber {
                    element.caretLocation = nextLine.start! + AccessibilityTextElement.globalColumnNumber - 1
                } else {
                    if let endLimit = nextLine.endLimit() {
                        let globalColumNumber = AccessibilityTextElement.globalColumnNumber
                        element.caretLocation = endLimit
                        AccessibilityTextElement.globalColumnNumber = globalColumNumber
                    }
                }
            }
        }
                
        return element
    }
    
    func k(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        guard element.role == .textArea else { return nil }

        var previousLine: AccessibilityTextElementLine?

        if element.currentLine.isLastLine() {
            previousLine = AccessibilityTextElementAdaptor.lineFor(location: element.caretLocation - 1)
        } else {
            previousLine = AccessibilityTextElementAdaptor.lineFor(lineNumber: element.currentLine.number! - 1)
        }

        if let previousLine = previousLine {
            if let previousLineLength = previousLine.length, previousLineLength > AccessibilityTextElement.globalColumnNumber {
                element.caretLocation = previousLine.start! + AccessibilityTextElement.globalColumnNumber - 1
            } else {
                if let endLimit = previousLine.endLimit() {
                    let globalColumnNumber = AccessibilityTextElement.globalColumnNumber
                    element.caretLocation = endLimit
                    AccessibilityTextElement.globalColumnNumber = globalColumnNumber
                }
            }
        }

        return element
    }

    func l(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if let endLimit = element.currentLine.endLimit(), element.caretLocation < endLimit {
            element.caretLocation += 1
        }

        return element
    }
    
    func t(characterToGoBefore: Character, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }
        
        let lineText = element.currentLine.value
        
//        if let characterToGoToIndex = textEngine.findNext(characterToGoTo, after: element.caretLocation, in: lineText) {
//            element.caretLocation = element.currentLine.start! + characterToGoToIndex            
//        }
        
        return element
    }

    func w(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        element.caretLocation = textEngine.wordForward(for: element.caretLocation, playground: element.value)

        return element
    }

    func dollarSign(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if let endLimit = element.currentLine.endLimit() {
            element.caretLocation = endLimit
        } else {
            if element.lastCharacterIsNotLinefeed() {
                element.caretLocation -= 1
            }
        }

        return element
    }

    func zero(on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        if let startLimit = element.currentLine.startLimit() {
            element.caretLocation = startLimit
        }

        return element
    }

    func blockCursor(_ status: BlockCursorStatus, on element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        guard var element = element else { return nil }

        switch status {
        case .on:
            element = h(on: element)!
            element.selectedLength = 0
        case .off:
            element.selectedLength = 0
        }

        return element
    }
    
    static func test(element: AccessibilityTextElement?) -> AccessibilityTextElement? {
        print("\ncaret position: \(String(describing: element?.caretLocation))")
        print("line start: \(String(describing: element?.currentLine.start))", "line end: \(String(describing: element?.currentLine.end))")
        
        return nil
    }

    static func focusedElement() -> AccessibilityTextElement? {
        return AccessibilityTextElementAdaptor.fromAXFocusedElement()
    }
    
    static func push(element: AccessibilityTextElement) -> Bool {
        print("move using Accessibility Stragety")

        return AccessibilityTextElementAdaptor.toAXFocusedElememt(from: element)
    }

}
