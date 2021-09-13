import Foundation
import KeyCombination
import KeyboardStrategy
import AccessibilityStrategy
import AXEngine
import Defaults


enum VimEngineMode {
    
    case insert
    case normal
    case operatorPendingForNormalMode
    case visual
    case operatorPendingForVisualMode
    
}


enum VimEngineStrategy {
    
    case keyboardStrategy
    case accessibilityStrategy
    
}


class KindaVimEngine {
    
    static var shared = KindaVimEngine()
    
    private var lastKeyCombinationPressed: KeyCombination?
    
    private(set) var currentMode: VimEngineMode = .insert
    private(set) var operatorPendingBuffer = [KeyCombination]()
    
    var lastYankStyle: VimEngineMoveStyle = .characterwise
    var visualStyle: VimEngineMoveStyle = .characterwise
    
    var display = Display()
    var axEngine: AXEngineProtocol = AXEngine()
    
    var focusedElementType: ElementType {
        switch axEngine.axRole() {
        case .textField, .textArea, .scrollArea, .webArea:
            return .textElement
        default:
            return .nonTextElement
        }
    }
    var focusedTextElement: AccessibilityTextElement? {
        accessibilityStrategy.focusedTextElement()
    }
        
    var keyboardStrategy: KeyboardStrategyProtocol = KeyboardStrategy()
    var ksNormalMode: KeyboardStrategyNormalModeProtocol = KeyboardStrategyNormalMode()
    var ksVisualMode: KeyboardStrategyVisualModeProtocol = KeyboardStrategyVisualMode()
    var accessibilityStrategy: AccessibilityStrategyProtocol = AccessibilityStrategy()
    var asNormalMode: AccessibilityStrategyNormalModeProtocol = AccessibilityStrategyNormalMode()
    var asVisualMode: AccessibilityStrategyVisualModeProtocol = AccessibilityStrategyVisualMode()

    
    private init() {
        print("engine started")
    }
    
    func handle(keyCombination: KeyCombination, enforceKeyboardStrategy: Bool = false) {
        if Defaults[.showCharactersTyped] == true {
            display.showKeysTyped(lastBeing: keyCombination)
        }
        
        switch (currentMode, enforceKeyboardStrategy) {
        case (.normal, false):
            handleNormalMode(using: .accessibilityStrategy, for: keyCombination)
        case (.normal, true):
            handleNormalMode(using: .keyboardStrategy, for: keyCombination)
        case (.operatorPendingForNormalMode, false):
            handleOperatorPendingForNormalMode(using: .accessibilityStrategy, for: keyCombination)
        case (.operatorPendingForNormalMode, true):
            handleOperatorPendingForNormalMode(using: .keyboardStrategy, for: keyCombination)
        case (.visual, false):
            handleVisualMode(using: .accessibilityStrategy, for: keyCombination)
        case (.visual, true):
            handleVisualMode(using: .keyboardStrategy, for: keyCombination)
        case (.operatorPendingForVisualMode, false):
            handleOperatorPendingForVisualMode(using: .accessibilityStrategy, for: keyCombination)
        case (.operatorPendingForVisualMode, true):
            handleOperatorPendingForVisualMode(using: .keyboardStrategy, for: keyCombination)
        default:
            ()
        }
    }
    
    func enterInsertMode() {
        currentMode = .insert
        resetOperatorPendingBuffer()
        
        if Defaults[.toggleHazeOverWindow] == true {
            display.hazeOver(.off)
        }
        
        if Defaults[.showCharactersTyped] == true {
            display.fadeOutCharactersWindow()
        }
    }
    
    func enterNormalMode() {
        if currentMode == .insert, let element = asNormalMode.h(on: focusedTextElement) {
            _ = push(element: element)
        }
        
        currentMode = .normal
        resetOperatorPendingBuffer()
        
        if Defaults[.toggleHazeOverWindow] == true {
            display.hazeOver(.on)
        }
    }
    
    func enterVisualMode() {
        currentMode = .visual
    }
    
    private func enterOperatorPendingForNormalMode(with keyCombination: KeyCombination) {
        currentMode = .operatorPendingForNormalMode
        operatorPendingBuffer.append(keyCombination)
    }
    
    private func enterOperatorPendingForVisualMode(with keyCombination: KeyCombination) {
        currentMode = .operatorPendingForVisualMode
        operatorPendingBuffer.append(keyCombination)
    }
    
    private func resetOperatorPendingBuffer() {
        operatorPendingBuffer = []
    }

    private func post(_ keyCombinations: [KeyCombination]) {
        keyboardStrategy.post(keyCombinations)
    }
 
    @discardableResult
    private func push(element: AccessibilityTextElement) -> Bool {
        return accessibilityStrategy.push(element: element)
    }
    
}


// Normal Mode
extension KindaVimEngine {
 
    private func handleNormalMode(using strategy: VimEngineStrategy, for keyCombination: KeyCombination) {
        switch strategy {
        case .accessibilityStrategy:
            tryHandlingNormalModeUsingAccessibilityStrategyFirst(for: keyCombination)
        case .keyboardStrategy:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        }        
    }
    
    private func tryHandlingNormalModeUsingAccessibilityStrategyFirst(for keyCombination: KeyCombination) {         
        switch keyCombination.vimKey {
        case .a:
            if let element = asNormalMode.a(on: focusedTextElement) {
                enterInsertMode()
                
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .A:
            if let element = asNormalMode.A(on: focusedTextElement) {
                enterInsertMode()
                
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .b:
            if let element = asNormalMode.b(on: focusedTextElement) {
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .B:
            if let element = asNormalMode.B(on: focusedTextElement) {
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .c:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .C:
            if let element = asNormalMode.C(on: focusedTextElement) {
                enterInsertMode()
                
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .d:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .controlD:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .e:
            if let element = asNormalMode.e(on: focusedTextElement) {
                push(element: element)
            }
        case .E:
            if let element = asNormalMode.E(on: focusedTextElement) {
                push(element: element)
            }
        case .f:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .F:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .g:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .G:
            if let element = asNormalMode.G(on: focusedTextElement) {
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .h:
            if let element = asNormalMode.h(on: focusedTextElement) {
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .i:
            if let element = asNormalMode.i(on: focusedTextElement) {
                push(element: element)
                
                enterInsertMode()
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .I:
            if let element = asNormalMode.I(on: focusedTextElement) {
                enterInsertMode()
                
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .j:
            if let element = asNormalMode.j(on: focusedTextElement) {
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .k:
            if let element = asNormalMode.k(on: focusedTextElement) {
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .l:
            if let element = asNormalMode.l(on: focusedTextElement) {
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .o:
            if let element = asNormalMode.o(on: focusedTextElement) {
                enterInsertMode()
                
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .O:
            if let element = asNormalMode.O(on: focusedTextElement) {
                enterInsertMode()
                
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }

        case .p:
            switch lastYankStyle {
            case .characterwise:
                if let element = asNormalMode.pForLastYankStyleCharacterwise(on: focusedTextElement) {
                    push(element: element) 
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asNormalMode.pForLastYankStyleLinewise(on: focusedTextElement) {
                    push(element: element) 
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            }   
        case .P:
            switch lastYankStyle {
            case .characterwise:
                if let element = asNormalMode.PForLastYankStyleCharacterwise(on: focusedTextElement) {
                   push(element: element) 
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asNormalMode.PForLastYankStyleLinewise(on: focusedTextElement) {
                    push(element: element) 
                } else {
                    handleNormalModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .r:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .controlR:
            if asNormalMode.controlR(on: focusedTextElement) != nil {
                post(ksNormalMode.controlRForAXElement())
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .s:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .t:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .T:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .u:
            if asNormalMode.u(on: focusedTextElement) != nil {
                post(ksNormalMode.uForAXElement())
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .controlU:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .v:
            enterVisualMode()
            visualStyle = .characterwise
            
            if let element = asVisualMode.vForEnteringFromNormalMode(on: focusedTextElement) {
                push(element: element)
            }
        case .V:
            enterVisualMode()
            visualStyle = .linewise
            
            if let element = asVisualMode.VForEnteringFromNormalMode(on: focusedTextElement) {
                push(element: element)
            }
        case .w:
            if let element = asNormalMode.w(on: focusedTextElement) {
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .W:
            if let element = asNormalMode.W(on: focusedTextElement) {
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }            
        case .x:
            if let element = asNormalMode.x(on: focusedTextElement) {
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }                
        case .X:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .y:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .Y:
            if let element = asNormalMode.yy(on: focusedTextElement) {
                lastYankStyle = .linewise
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        // to test (can dump info to console, send stuff to AX etc.)
        case .commandD:
            if let element = AccessibilityStrategyNormalMode.test(element: focusedTextElement) {
                _ = push(element: element)
            }
        case .escape:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            
            // special case. we currently are overriding how
            // escape behaves so that we can comment or indent
            // whole bunch of lines at the same time.
            if var element = focusedTextElement {
                element.selectedLength = 0
                element.selectedText = nil
                push(element: element)
            }
        case .enter:
            handleNormalModeUsingKeyboardStrategy(for: keyCombination)
        case .caret:
            if let element = asNormalMode.caret(on: focusedTextElement) {
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .dollarSign:
            if let element = asNormalMode.dollarSign(on: focusedTextElement) {
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .leftBrace:
            if let element = asNormalMode.leftBrace(on: focusedTextElement) {
                push(element: element)
            }
        case .leftBracket:
            enterOperatorPendingForNormalMode(with: KeyCombination(key: .leftBracket))
        case .leftChevron:
            enterOperatorPendingForNormalMode(with: KeyCombination(vimKey: .leftChevron))
        case .percent:
            if let element = asNormalMode.percent(on: focusedTextElement) {
                push(element: element)
            }
        case .rightBrace:
            if let element = asNormalMode.rightBrace(on: focusedTextElement) {
                push(element: element)
            }
        case .rightBracket:
            enterOperatorPendingForNormalMode(with: KeyCombination(key: .rightBracket))
        case .rightChevron:
            enterOperatorPendingForNormalMode(with: KeyCombination(vimKey: .rightChevron))
        case .underscore:
            if let element = asNormalMode.underscore(on: focusedTextElement) {
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        case .zero:
            if let element = asNormalMode.zero(on: focusedTextElement) {
                push(element: element)
            } else {
                handleNormalModeUsingKeyboardStrategy(for: keyCombination)
            }
        default:
            ()
        }
    }
    
    private func handleNormalModeUsingKeyboardStrategy(for keyCombination: KeyCombination) {         
        switch keyCombination.vimKey {
        case .a:
            enterInsertMode()
            
            post(ksNormalMode.a())
        case .A:
            enterInsertMode()
            
            post(ksNormalMode.A())
        case .b:
            post(ksNormalMode.b())
        case .B:
            post(ksNormalMode.b())
        case .c:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .C:
            enterInsertMode()
            
            post(ksNormalMode.C())
        case .d:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .controlD:
            post(ksNormalMode.controlD())
        case .f:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .F:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .g:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .G:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.GForTextElement())
            case .nonTextElement:
                post(ksNormalMode.GForNonTextElement())
            }
        case .h:
            post(ksNormalMode.h())
        case .i:
            enterInsertMode()
        case .I:
            enterInsertMode()
            
            post(ksNormalMode.I())
        case .j:
            post(ksNormalMode.j())
        case .k:
            post(ksNormalMode.k())
        case .l:
            post(ksNormalMode.l())
        case .o:
            enterInsertMode()
            
            post(ksNormalMode.o())
        case .O:
            enterInsertMode()
            
            post(ksNormalMode.O())
        case .p:
            post(ksNormalMode.p())
        case .P:
            post(ksNormalMode.P())
        case .r:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .controlR:
            post(ksNormalMode.controlR())
        case .s:
            enterInsertMode()
            
            post(ksNormalMode.s())
        case .t:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .T:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .u:
            post(ksNormalMode.u())
        case .controlU:
            post(ksNormalMode.controlU())
        case .v:
            enterVisualMode()
            visualStyle = .characterwise
        case .V:
            enterVisualMode()
            visualStyle = .linewise
        case .w:
            post(ksNormalMode.w())
        case .W:
            post(ksNormalMode.w())
        case .x:
            post(ksNormalMode.x())
        case .X:
            post(ksNormalMode.X())
        case .y:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .Y:
            lastYankStyle = .linewise

            post(ksNormalMode.yy())
        case .escape:
            enterInsertMode()            
            post(ksNormalMode.escape())
        case .enter:
            enterInsertMode()
            
            post(ksNormalMode.enter())
        case .caret:
            post(ksNormalMode.caret())
        case .dollarSign:
            post(ksNormalMode.dollarSign())
        case .underscore:
            post(ksNormalMode.underscore())
        case .zero:
            post(ksNormalMode.zero())
        default:
            ()
        }
    }
    
}


// Operator Pending for Normal Mode
extension KindaVimEngine {
    
    func handleOperatorPendingForNormalMode(using strategy: VimEngineStrategy, for keyCombination: KeyCombination) {
        operatorPendingBuffer.append(keyCombination)
        
        switch strategy {
        case .accessibilityStrategy:
            tryParsingOperatorCommandForNormalModeUsingAccessibilityStrategyFirst()
        case .keyboardStrategy:
            parseOperatorCommandForNormalModeUsingKeyboardStrategy()
        }
        
        if currentMode != .operatorPendingForNormalMode {
            resetOperatorPendingBuffer()
        }
    }

    private func tryParsingOperatorCommandForNormalModeUsingAccessibilityStrategyFirst() {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.c, .a]:
            ()
        case [.c, .a, .w]:
            ()
        case [.c, .b]:
            parseOperatorCommandForNormalModeUsingKeyboardStrategy()
        case [.c, .c]:
            if let element = asNormalMode.cc(on: focusedTextElement) {
                enterInsertMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .f]:
            ()
        case [.c, .F]:
            ()
        case [.c, .g]:
            ()
        case [.c, .g, .g]:
            if let element = asNormalMode.cgg(on: focusedTextElement) {
                enterInsertMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .G]:
            if let element = asNormalMode.cG(on: focusedTextElement) {
                enterInsertMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.c, .i]:
            ()
        case [.c, .i, .doubleQuote]:
            enterNormalMode()
                        
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciDoubleQuote(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                lastYankStyle = .characterwise
                enterInsertMode()
            }
        case [.c, .i, .leftBrace]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciLeftBrace(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .leftBracket]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciLeftBracket(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .leftParenthesis]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciLeftParenthesis(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .rightBrace]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciRightBrace(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .rightBracket]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciRightBracket(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .rightParenthesis]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciRightParenthesis(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .singleQuote]:
            enterNormalMode()
            
            if let element = asNormalMode.ciSingleQuote(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }            
        case [.c, .i, .backtick]:
            enterNormalMode()
            
            if let element = asNormalMode.ciBacktick(on: focusedTextElement), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .w]:
            if let element = asNormalMode.ciw(on: focusedTextElement) {
                enterInsertMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }           
        case [.c, .t]:
            ()
        case [.c, .T]:
            ()
        case [.d, .a]:
            ()
        case [.d, .a, .w]:
            ()
        case [.d, .b]:
            parseOperatorCommandForNormalModeUsingKeyboardStrategy()
        case [.d, .d]:
            if let element = asNormalMode.dd(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .f]:
            ()
        case [.d, .F]:
            ()
        case [.d, .g]:
            ()
        case [.d, .g, .g]:
            parseOperatorCommandForNormalModeUsingKeyboardStrategy()
        case [.d, .G]:
            parseOperatorCommandForNormalModeUsingKeyboardStrategy()
        case [.d, .i]:
            ()
        case [.d, .i, .w]:
            ()
        case [.d, .j]:
            if let element = asNormalMode.dj(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .k]:
            if let element = asNormalMode.dk(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.d, .t]:
            ()
        case [.d, .T]:
            ()
        case [.g, .e]:
            enterNormalMode()
            
            if let element = asNormalMode.ge(on: focusedTextElement) {
                push(element: element)
            }     
        case [.g, .g]:
            if let element = asNormalMode.gg(on: focusedTextElement) {
                enterNormalMode()
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.g, .E]:
            enterNormalMode()
            
            if let element = asNormalMode.gE(on: focusedTextElement) {
                push(element: element)
            }
        case [.leftBracket, .leftBrace]:
            enterNormalMode()
            
            if let element = asNormalMode.leftBracketLeftBrace(on: focusedTextElement) {
                push(element: element)
            }
        case [.leftBracket, .leftParenthesis]:
            enterNormalMode()
            
            if let element = asNormalMode.leftBracketLeftParenthesis(on: focusedTextElement) {
                push(element: element)
            }
        case [.leftChevron, .leftChevron]:
            enterNormalMode()
            
            if let element = asNormalMode.leftChevronLeftChevron(on: focusedTextElement) {
                push(element: element)
            }
        case [.rightBracket, .rightBrace]:
            enterNormalMode()
            
            if let element = asNormalMode.rightBracketRightBrace(on: focusedTextElement) {
                push(element: element)
            }
        case [.rightBracket, .rightParenthesis]:
            enterNormalMode()
            
            if let element = asNormalMode.rightBracketRightParenthesis(on: focusedTextElement) {
                push(element: element)
            }
        case [.rightChevron, .rightChevron]:
            enterNormalMode()
            
            if let element = asNormalMode.rightChevronRightChevron(on: focusedTextElement) {
                push(element: element)
            }
        case [.y, .f]:
            ()
        case [.y, .F]:
            ()
        case [.y, .i]:
            ()
        case [.y, .i, .backtick]:
            enterNormalMode()
            
            if let element = asNormalMode.yiBacktick(on: focusedTextElement) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .doubleQuote]:
            enterNormalMode()
            
            if let element = asNormalMode.yiDoubleQuote(on: focusedTextElement) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .singleQuote]:
            enterNormalMode()
            
            if let element = asNormalMode.yiSingleQuote(on: focusedTextElement) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .leftBrace]:
            enterNormalMode()
            
            if let element = asNormalMode.yiLeftBrace(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
        case [.y, .i, .leftBracket]:
            enterNormalMode()
            
            if let element = asNormalMode.yiLeftBracket(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
        case [.y, .i, .leftParenthesis]:
            enterNormalMode()
            
            if let element = asNormalMode.yiLeftParenthesis(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
        case [.y, .i, .rightBrace]:
            enterNormalMode()
            
            if let element = asNormalMode.yiRightBrace(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
        case [.y, .i, .rightBracket]:
            enterNormalMode()
            
            if let element = asNormalMode.yiRightBracket(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
        case [.y, .i, .rightParenthesis]:
            enterNormalMode()
            
            if let element = asNormalMode.yiRightParenthesis(on: focusedTextElement, &lastYankStyle) {
                push(element: element)
            }
        case [.y, .i, .w]:
            if let element = asNormalMode.yiw(on: focusedTextElement) {
                enterNormalMode()
                lastYankStyle = .characterwise
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        case [.y, .t]:
            ()
        case [.y, .T]:
            ()        
        case [.y, .y]:
            if let element = asNormalMode.yy(on: focusedTextElement) {
                enterNormalMode()
                lastYankStyle = .linewise
                push(element: element)
            } else {
                parseOperatorCommandForNormalModeUsingKeyboardStrategy()
            }
        default:
            // cf, cF, ct, cT
            if operatorPendingBuffer.first?.vimKey == .c {
                var element: AccessibilityTextElement?
                
                if operatorPendingBuffer[1].vimKey == .f, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cf(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .F, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cF(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .t, let character = operatorPendingBuffer.last {
                    element = asNormalMode.ct(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .T, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cT(to: character.character, on: focusedTextElement)
                }
                
                if let element = element, element.selectedText != nil {
                    push(element: element)
                    enterInsertMode()
                    
                    return
                }
            }
            
            // df, dF, dt, dT
            if operatorPendingBuffer.first?.vimKey == .d {
                var element: AccessibilityTextElement?
                
                if operatorPendingBuffer[1].vimKey == .f, let character = operatorPendingBuffer.last {
                    element = asNormalMode.df(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .F, let character = operatorPendingBuffer.last {
                    element = asNormalMode.dF(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .t, let character = operatorPendingBuffer.last {
                    element = asNormalMode.dt(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .T, let character = operatorPendingBuffer.last {
                    element = asNormalMode.dT(to: character.character, on: focusedTextElement)
                }
                
                if let element = element {
                    push(element: element)
                }
            }
                            
            if operatorPendingBuffer.first?.vimKey == .f, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.f(to: character.character, on: focusedTextElement) {
                    push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .F, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.F(to: character.character, on: focusedTextElement) {
                    push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .r, let replacement = operatorPendingBuffer.last {                
                if let element = asNormalMode.r(with: replacement.character, on: focusedTextElement) {
                    push(element: element)
                } else {
                    parseOperatorCommandForNormalModeUsingKeyboardStrategy()
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .t, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.t(to: character.character, on: focusedTextElement) {
                    push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .T, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.T(to: character.character, on: focusedTextElement) {
                    push(element: element)
                }
            }
            
            // yf, yF, yt, yT
            if operatorPendingBuffer.first?.vimKey == .y {
                var element: AccessibilityTextElement?
                
                if operatorPendingBuffer[1].vimKey == .f, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yf(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .F, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yF(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .t, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yt(to: character.character, on: focusedTextElement)
                }
                
                if operatorPendingBuffer[1].vimKey == .T, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yT(to: character.character, on: focusedTextElement)
                }
                
                if let element = element {
                    push(element: element)
                    lastYankStyle = .characterwise                    
                }
            }
                        
            // if we don't recognize any operator move
            // then we go back to normal mode
            // and the operator pending buffer will be resetted
            enterNormalMode()
        }
    }
    
    private func parseOperatorCommandForNormalModeUsingKeyboardStrategy() {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.c, .b]:
            enterInsertMode()
            
            post(ksNormalMode.cb())
        case [.c, .c]:
            enterInsertMode()
            
            post(ksNormalMode.cc())
       case [.c, .f]:
            ()
        case [.c, .F]:
            ()
        case [.c, .g]:
            ()
        case [.c, .g, .g]:
            enterInsertMode()
            
            post(ksNormalMode.cgg())
        case [.c, .G]:
            enterInsertMode()
            
            post(ksNormalMode.cG())
        case [.c, .i]:
            ()
        case [.c, .i, .w]:
            enterInsertMode()
            
            post(ksNormalMode.ciw())
        case [.c, .t]:
            ()
        case [.c, .T]:
            ()
        case [.d, .a]:
            ()
        case [.d, .a, .w]:
            ()
        case [.d, .b]:
            enterNormalMode()
            
            post(ksNormalMode.db())
        case [.d, .d]:
            enterNormalMode()
            
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.ddForTextElement())
            default:
                post(ksNormalMode.ddForNonTextElement())
            }
        case [.d, .g]:
            ()
        case [.d, .g, .g]:
            enterNormalMode()
            
            post(ksNormalMode.dgg())
        case [.d, .G]:
            enterNormalMode()
            
            post(ksNormalMode.dG())
        case [.d, .j]:
            enterNormalMode()
            
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.djForTextElement())
            default:
                post(ksNormalMode.djForNonTextElement())
            }
        case [.d, .k]:
            enterNormalMode()
            
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.dkForTextElement())
            default:
                post(ksNormalMode.dkForNonTextElement())
            }
        case [.g, .g]:
            enterNormalMode()
                    
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.ggForTextElement())
            default:
                post(ksNormalMode.ggForNonTextElement())
            }
        case [.y, .i]:
            ()
        case [.y, .i, .w]:
            enterNormalMode()
            lastYankStyle = .characterwise
            
            post(ksNormalMode.yiw())
        case [.y, .y]:
            enterNormalMode()
            lastYankStyle = .linewise
            
            post(ksNormalMode.yy())
        default:
            if operatorPendingBuffer.first?.vimKey == .r, let replacement = operatorPendingBuffer.last {                
                post(ksNormalMode.r(with: replacement))
            }
            
            // if we don't recognize any operator move
            // then we go back to normal mode
            // and the operator pending buffer will be resetted
            enterNormalMode()
        }
    }
    
}


// Visual Mode
extension KindaVimEngine {
    
    func handleVisualMode(using strategy: VimEngineStrategy, for keyCombination: KeyCombination) {
        switch strategy {
        case .accessibilityStrategy:
            tryHandlingVisualModeUsingAccessibilityStrategyFirst(for: keyCombination)
        case .keyboardStrategy:
            handleVisualModeUsingKeyboardStrategy(for: keyCombination)
        }
    }
    
    private func tryHandlingVisualModeUsingAccessibilityStrategyFirst(for keyCombination: KeyCombination) {
        switch keyCombination.vimKey {
        case .b:
            // TODO: write this with a switch, the same than other moves
            // that will make it very clear that we don't have a linewise move for this one
            if visualStyle == .characterwise, let element = asVisualMode.bForVisualStyleCharacterwise(on: focusedTextElement) {
                push(element: element)
            }
        case .c:
            enterInsertMode()
            
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.cForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                }       
            case .linewise:
                if let element = asVisualMode.cForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                } 
            }
        case .d:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.dForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.dForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .e:
            if visualStyle == .characterwise, let element = asVisualMode.eForVisualStyleCharacterwise(on: focusedTextElement) {
                push(element: element)
            }
        case .g:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .G:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.GForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.GForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .h:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.hForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                ()
            }
        case .j:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.jForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.jForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .k:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.kForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.kForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .l:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.lForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                ()
            }
        case .o:
            if let element = asVisualMode.o(on: focusedTextElement) {
                push(element: element)
            }
        case .v:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.vForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.vForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                    
                    visualStyle = .characterwise
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .V:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.VForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    
                    visualStyle = .linewise
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.VForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                    
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .w:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.wForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                ()
            }
        case .y:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.yForVisualStyleCharacterwise(on: focusedTextElement, &lastYankStyle) {
                    push(element: element)
                    
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .linewise:
                if let element = asVisualMode.yForVisualStyleLinewise(on: focusedTextElement, &lastYankStyle) {
                    push(element: element)
                    
                    enterNormalMode()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            }
        case .dollarSign:
            if visualStyle == .characterwise, let element = asVisualMode.dollarSignForVisualStyleCharacterwise(on: focusedTextElement) {
                push(element: element)
            }           
        case .escape:
            // currently a hack
            // so that we can comment multiple lines by keeping the VM selection :D
            enterInsertMode()
        case .zero:
            if visualStyle == .characterwise, let element = asVisualMode.zeroForVisualStyleCharacterwise(on: focusedTextElement) {
                push(element: element)
            }  
        default:
            ()
        }
    }
    
    private func handleVisualModeUsingKeyboardStrategy(for keyCombination: KeyCombination) {
        switch keyCombination.vimKey {
        case .d:
            post(ksVisualMode.d())
            
            enterNormalMode()
        case .g:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .G:
            post(ksVisualMode.G())
        case .h:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.h())
            case .linewise:
                ()
            }
        case .j:
            post(ksVisualMode.j())
        case .k:
            post(ksVisualMode.k())
        case .l:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.l())
            case .linewise:
                ()
            }
        case .v:
            if visualStyle == .characterwise {
                enterNormalMode()
            } else {
                visualStyle = .characterwise
            }
        case .V:
            if visualStyle == .linewise {
                enterNormalMode()
            } else {
                visualStyle = .linewise
            }
        case .w:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.w())
            case .linewise:
                ()
            }
        case .y:
            post(ksVisualMode.y())
            
            enterNormalMode()
        case .escape:
            enterInsertMode()
        default:
            ()
        }
    }
    
}


// Operator Pending for Visual Mode
extension KindaVimEngine {
    
    func handleOperatorPendingForVisualMode(using strategy: VimEngineStrategy, for keyCombination: KeyCombination) {
        operatorPendingBuffer.append(keyCombination)
        
        switch strategy {
        case .accessibilityStrategy:
            tryParsingOperatorCommandForVisualModeUsingAccessibilityStrategyFirst()
        case .keyboardStrategy:
            parseOperatorCommandForVisualModeUsingKeyboardStrategy()
        }
        
        if currentMode != .operatorPendingForVisualMode {
            resetOperatorPendingBuffer()
        }
    }
    
    private func tryParsingOperatorCommandForVisualModeUsingAccessibilityStrategyFirst() {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.g, .g]:
            switch visualStyle {
            case .characterwise:
                if let element = asVisualMode.ggForVisualStyleCharacterwise(on: focusedTextElement) {
                    push(element: element)
                    
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }       
            case .linewise:
                if let element = asVisualMode.ggForVisualStyleLinewise(on: focusedTextElement) {
                    push(element: element)
                    
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }       
            }
        default:
            // if we don't recognize any operator move
            // go back to visual mode
            enterVisualMode()
        }
    }
    
    private func parseOperatorCommandForVisualModeUsingKeyboardStrategy() {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.g, .g]:
            post(ksVisualMode.gg())
            
            enterVisualMode()
        default:
            // if we don't recognize any operator move
            // go back to visual mode
            enterVisualMode()
        }
    }
    
}
