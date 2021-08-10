import Foundation


enum VimEngineMode {
    
    case insert
    case normal
    case operatorPendingForNormalMode
    case visual
    case operatorPendingForVisualMode
    
}


enum VimEngineMoveStyle {
    
    case characterwise
    case linewise
    
}


class KindaVimEngine {
    
    static var shared = KindaVimEngine()
    
    private(set) var currentMode: VimEngineMode = .insert
    private(set) var operatorPendingBuffer = [KeyCombination]()
    
    var lastYankStyle: VimEngineMoveStyle = .characterwise
    var visualStyle: VimEngineMoveStyle = .characterwise
    var display = Display()
    var keyboardStrategy: KeyboardStrategyProtocol = KeyboardStrategy()
    var ksNormalMode: KeyboardStrategyNormalModeProtocol = KeyboardStrategyNormalMode()
    var ksVisualMode: KeyboardStrategyVisualModeProtocol = KeyboardStrategyVisualMode()
    var accessibilityStrategy: AccessibilityStrategyProtocol = AccessibilityStrategy()
    var asNormalMode: AccessibilityStrategyNormalModeProtocol = AccessibilityStrategyNormalMode()
    var asVisualMode: AccessibilityStrategyVisualModeProtocol = AccessibilityStrategyVisualMode()

    
    private init() {
        print("engine started")
    }
    
    func handle(keyCombination: KeyCombination) {
        switch currentMode {
        case .normal:
            handleNormalMode(with: keyCombination)
        case .operatorPendingForNormalMode:
            handleOperatorPendingForNormalMode(with: keyCombination)
        case .visual:
            handleVisualMode(with: keyCombination)
        case .operatorPendingForVisualMode:
            handleOperatorPendingForVisualMode(with: keyCombination)
        default:
            ()
        }
    }
    
    func enterInsertMode() {
        currentMode = .insert
        resetOperatorPendingBuffer()
        
        display.hazeOver(.off)
    }
    
    func enterNormalMode() {
        if currentMode == .insert, let element = asNormalMode.h(on: focusedTextElement()) {
            _ = push(element: element)
        }
        
        currentMode = .normal
        resetOperatorPendingBuffer()
        resetVisualMode()

        display.hazeOver(.on)
    }
    
    private func enterOperatorPendingForNormalMode(with keyCombination: KeyCombination) {
        currentMode = .operatorPendingForNormalMode
        operatorPendingBuffer.append(keyCombination)
    }
    
    private func enterOperatorPendingForVisualMode(with keyCombination: KeyCombination) {
        currentMode = .operatorPendingForVisualMode
        operatorPendingBuffer.append(keyCombination)
    }
    
    func enterVisualMode() {
        currentMode = .visual
    }
    
    private func resetOperatorPendingBuffer() {
        operatorPendingBuffer = []
    }
    
    private func resetVisualMode() {
        AccessibilityStrategyVisualMode.reset()
    }

    private func post(_ keyCombinations: [KeyCombination]) {
        keyboardStrategy.post(keyCombinations)
    }

    private func focusedTextElement() -> AccessibilityTextElement? {
        return accessibilityStrategy.focusedTextElement()
    }

    @discardableResult
    private func push(element: AccessibilityTextElement) -> Bool {
        return accessibilityStrategy.push(element: element)
    }
    
}


// normal mode
extension KindaVimEngine {
 
    func handleNormalMode(with keyCombination: KeyCombination) {
        switch keyCombination.vimKey {
        case .a:
            enterInsertMode()
            
            if let element = asNormalMode.a(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.a())
            }
        case .A:
            enterInsertMode()
            
            if let element = asNormalMode.A(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.A())
            }
        case .b:
            if let element = asNormalMode.b(on: focusedTextElement()) {
               push(element: element)
            } else {
                post(ksNormalMode.b())
            }
        case .B:
            if let element = asNormalMode.B(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.b())
            }
        case .c:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .C:
            enterInsertMode()
            
            if let element = asNormalMode.C(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.C())
            }
        case .d:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .controlD:
            post(ksNormalMode.controlD())
        case .e:
            if let element = asNormalMode.e(on: focusedTextElement()) {
                push(element: element)
            }
        case .E:
            if let element = asNormalMode.E(on: focusedTextElement()) {
                push(element: element)
            }
        case .f:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .F:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .g:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .G:
            if let element = asNormalMode.G(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.G(on: AXEngine.axRole()))
            }
        case .h:
            if let element = asNormalMode.h(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.h())
            }
        case .i:
            if let element = asNormalMode.i(on: focusedTextElement()) {
                push(element: element)
            }
            
            enterInsertMode()
        case .I:
            enterInsertMode()
            
            if let element = asNormalMode.I(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.I())
            }
        case .j:
            if let element = asNormalMode.j(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.j())
            }
        case .k:
            if let element = asNormalMode.k(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.k())
            }
        case .l:
            if let element = asNormalMode.l(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.l())
            }
        case .o:
            enterInsertMode()
            
            if let element = asNormalMode.o(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.o())
            }
        case .O:
            enterInsertMode()
            
            if let element = asNormalMode.O(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.O())
            }
        case .p:
            if let element = asNormalMode.p(on: focusedTextElement()) {
                push(element: element)
                
                if var element = asNormalMode.h(on: focusedTextElement()) {                        
                    element.selectedLength = element.characterLength
                    push(element: element)
                }   
            } else {
                post(ksNormalMode.p())
            }
        case .P:
            if let element = asNormalMode.P(on: focusedTextElement()) {
                push(element: element)
                
                if var element = asNormalMode.h(on: focusedTextElement()) {                        
                    element.selectedLength = element.characterLength
                    push(element: element)
                }   
            } else {
//                post(ksNormalMode.P())
            }
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
            
            if let element = asVisualMode.v(on: focusedTextElement()) {
                push(element: element)
            }
        case .V:
            enterVisualMode()
            visualStyle = .linewise
            
            if let element = asVisualMode.V(on: focusedTextElement()) {
                push(element: element)
            }
        case .w:
            if let element = asNormalMode.w(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.w())
            }
        case .W:
            if let element = asNormalMode.W(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.w())
            }            
        case .x:
            if let element = asNormalMode.x(on: focusedTextElement()) {
                push(element: element)
                
                if var element = focusedTextElement() {
                    element.selectedLength = element.characterLength
                    element.selectedText = nil
                    push(element: element)
                }
            } else {
                post(ksNormalMode.x())
            }                
        case .X:
            post(ksNormalMode.X())
        case .y:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .Y:
            lastYankStyle = .linewise

            if let element = asNormalMode.yy(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.yy())
            }
        // to test (can dump info to console, send stuff to AX etc.)
        case .commandD:
            if let element = AccessibilityStrategyNormalMode.test(element: focusedTextElement()) {
                _ = push(element: element)
            }
        // temporary for escape to enter Command Mode
        // and escape again to send escape key to macOS
        case .escape:
            enterInsertMode()            
            post(ksNormalMode.escape())
            
            if var element = focusedTextElement() {
                element.selectedLength = 0
                element.selectedText = nil
                push(element: element)
            }
        // temporary for pressing enter in Command Mode
        // to act like an enter in Insert Mode
        // checking if it feels better (like in Alfred)
        case .enter:
            enterInsertMode()
            
            post(ksNormalMode.enter())
        case .caret:
            if let element = asNormalMode.caret(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.caret())
            }
        case .dollarSign:
            if let element = asNormalMode.dollarSign(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.dollarSign())
            }
        case .leftBrace:
            if let element = asNormalMode.leftBrace(on: focusedTextElement()) {
                push(element: element)
            }
        case .leftBracket:
            enterOperatorPendingForNormalMode(with: KeyCombination(key: .leftBracket))
        case .leftChevron:
            enterOperatorPendingForNormalMode(with: KeyCombination(vimKey: .leftChevron))
        case .percent:
            if let element = asNormalMode.percent(on: focusedTextElement()) {
                push(element: element)
            }
        case .rightBrace:
            if let element = asNormalMode.rightBrace(on: focusedTextElement()) {
                push(element: element)
            }
        case .rightBracket:
            enterOperatorPendingForNormalMode(with: KeyCombination(key: .rightBracket))
        case .rightChevron:
            enterOperatorPendingForNormalMode(with: KeyCombination(vimKey: .rightChevron))
        case .underscore:
            if let element = asNormalMode.underscore(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.underscore())
            }
        case .zero:
            if let element = asNormalMode.zero(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.zero())
            }
        default:
            ()
        }
    }
        
}


// operator pending for normal mode
extension KindaVimEngine {
    
    func handleOperatorPendingForNormalMode(with keyCombination: KeyCombination) {
        operatorPendingBuffer.append(keyCombination)
        
        parseOperatorCommand()
        
        if currentMode != .operatorPendingForNormalMode {
            resetOperatorPendingBuffer()
        }
    }

    private func parseOperatorCommand() {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.c, .a]:
            ()
        case [.c, .a, .w]:
            ()
        case [.c, .b]:
            enterInsertMode()
            
            post(ksNormalMode.cb())
        case [.c, .c]:
            enterInsertMode()
            
            if let element = asNormalMode.cc(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.cc())
            }
        case [.c, .f]:
            ()
        case [.c, .F]:
            ()
        case [.c, .g]:
            ()
        case [.c, .g, .g]:
            enterInsertMode()
            
            if let element = asNormalMode.cgg(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.cgg())
            }
        case [.c, .G]:
            enterInsertMode()
            
            if let element = asNormalMode.cG(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.cG())
            }
        case [.c, .i]:
            ()
        case [.c, .i, .doubleQuote]:
            enterNormalMode()
                        
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciDoubleQuote(on: focusedTextElement()), element.selectedText != nil {
                push(element: element)
                lastYankStyle = .characterwise
                enterInsertMode()
            }
        case [.c, .i, .leftBrace]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciLeftBrace(on: focusedTextElement()), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .leftBracket]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciLeftBracket(on: focusedTextElement()), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .leftParenthesis]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciLeftParenthesis(on: focusedTextElement()), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .rightBrace]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciRightBrace(on: focusedTextElement()), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .rightBracket]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciRightBracket(on: focusedTextElement()), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .rightParenthesis]:
            enterNormalMode()
            
            // if element.selectedText is nil that means that the move didn't find a pair of "something" to empty
            if let element = asNormalMode.ciRightParenthesis(on: focusedTextElement()), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .singleQuote]:
            enterNormalMode()
            
            if let element = asNormalMode.ciSingleQuote(on: focusedTextElement()), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }            
        case [.c, .i, .backtick]:
            enterNormalMode()
            
            if let element = asNormalMode.ciBacktick(on: focusedTextElement()), element.selectedText != nil {
                push(element: element)
                enterInsertMode()
            }
        case [.c, .i, .w]:
            enterInsertMode()
            
            if let element = asNormalMode.ciw(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.ciw())
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
            enterNormalMode()
            
            post(ksNormalMode.db())
        case [.d, .d]:
            enterNormalMode()
            
            if let element = asNormalMode.dd(on: focusedTextElement()) {
                push(element: element)
                
                if var element = focusedTextElement() {
                    element.selectedLength = element.characterLength
                    element.selectedText = nil
                    push(element: element)
                }
            } else {
                post(ksNormalMode.dd(on: AXEngine.axRole()))
            }
        case [.d, .f]:
            ()
        case [.d, .F]:
            ()
        case [.d, .g]:
            ()
        case [.d, .g, .g]:
            enterNormalMode()
            
            post(ksNormalMode.dgg())
        case [.d, .i]:
            ()
        case [.d, .i, .w]:
            ()
        case [.d, .j]:
            enterNormalMode()
            
            if let element = asNormalMode.dj(on: focusedTextElement()) {
                push(element: element)
                
                if var element = focusedTextElement() {
                    element.selectedText = nil
                    push(element: element)
                }
            } else {
                post(ksNormalMode.dj())
            }
        case [.d, .G]:
            enterNormalMode()
            
            post(ksNormalMode.dG())
        case [.d, .t]:
            ()
        case [.d, .T]:
            ()
        case [.g, .e]:
            enterNormalMode()
            
            if let element = asNormalMode.ge(on: focusedTextElement()) {                
                push(element: element)
            }     
        case [.g, .g]:
            enterNormalMode()
            
            if let element = asNormalMode.gg(on: focusedTextElement()) {                
                push(element: element)
            } else {
                post(ksNormalMode.gg(on: AXEngine.axRole()))
            }
        case [.g, .E]:
            enterNormalMode()
            
            if let element = asNormalMode.gE(on: focusedTextElement()) {                
                push(element: element)
            }
        case [.leftBracket, .leftBrace]:
            enterNormalMode()
            
            if let element = asNormalMode.leftBracketLeftBrace(on: focusedTextElement()) {
                push(element: element)
            }
        case [.leftBracket, .leftParenthesis]:
            enterNormalMode()
            
            if let element = asNormalMode.leftBracketLeftParenthesis(on: focusedTextElement()) {
                push(element: element)
            }
        case [.leftChevron, .leftChevron]:
            enterNormalMode()
            
            if let element = asNormalMode.leftChevronLeftChevron(on: focusedTextElement()) {
                push(element: element)
            }
        case [.rightBracket, .rightBrace]:
            enterNormalMode()
            
            if let element = asNormalMode.rightBracketRightBrace(on: focusedTextElement()) {
                push(element: element)
            }
        case [.rightBracket, .rightParenthesis]:
            enterNormalMode()
            
            if let element = asNormalMode.rightBracketRightParenthesis(on: focusedTextElement()) {
                push(element: element)
            }
        case [.rightChevron, .rightChevron]:
            enterNormalMode()
            
            if let element = asNormalMode.rightChevronRightChevron(on: focusedTextElement()) {
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
            
            if let element = asNormalMode.yiBacktick(on: focusedTextElement()) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .doubleQuote]:
            enterNormalMode()
            
            if let element = asNormalMode.yiDoubleQuote(on: focusedTextElement()) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .singleQuote]:
            enterNormalMode()
            
            if let element = asNormalMode.yiSingleQuote(on: focusedTextElement()) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .leftBrace]:
            enterNormalMode()
            
            if let element = asNormalMode.yiLeftBrace(on: focusedTextElement()) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .leftBracket]:
            enterNormalMode()
            
            if let element = asNormalMode.yiLeftBracket(on: focusedTextElement()) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .leftParenthesis]:
            enterNormalMode()
            
            if let element = asNormalMode.yiLeftParenthesis(on: focusedTextElement()) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .rightBrace]:
            enterNormalMode()
            
            if let element = asNormalMode.yiRightBrace(on: focusedTextElement()) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .rightBracket]:
            enterNormalMode()
            
            if let element = asNormalMode.yiRightBracket(on: focusedTextElement()) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .rightParenthesis]:
            enterNormalMode()
            
            if let element = asNormalMode.yiRightParenthesis(on: focusedTextElement()) {
                push(element: element)
                lastYankStyle = .characterwise
            }
        case [.y, .i, .w]:
            enterNormalMode()
            lastYankStyle = .characterwise
            
            if let element = asNormalMode.yiw(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.yiw())
            }
        case [.y, .t]:
            ()
        case [.y, .T]:
            ()        
        case [.y, .y]:
            enterNormalMode()
            lastYankStyle = .linewise
            
            if let element = asNormalMode.yy(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksNormalMode.yy())
            }
        default:
            // cf, cF, ct, cT
            if operatorPendingBuffer.first?.vimKey == .c {
                var element: AccessibilityTextElement?
                
                if operatorPendingBuffer[1].vimKey == .f, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cf(to: character.character, on: focusedTextElement())
                }
                
                if operatorPendingBuffer[1].vimKey == .F, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cF(to: character.character, on: focusedTextElement())
                }
                
                if operatorPendingBuffer[1].vimKey == .t, let character = operatorPendingBuffer.last {
                    element = asNormalMode.ct(to: character.character, on: focusedTextElement())
                }
                
                if operatorPendingBuffer[1].vimKey == .T, let character = operatorPendingBuffer.last {
                    element = asNormalMode.cT(to: character.character, on: focusedTextElement())
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
                    element = asNormalMode.df(to: character.character, on: focusedTextElement())                    
                }
                
                if operatorPendingBuffer[1].vimKey == .F, let character = operatorPendingBuffer.last {
                    element = asNormalMode.dF(to: character.character, on: focusedTextElement())                    
                }
                
                if operatorPendingBuffer[1].vimKey == .t, let character = operatorPendingBuffer.last {
                    element = asNormalMode.dt(to: character.character, on: focusedTextElement())                                           
                }
                
                if operatorPendingBuffer[1].vimKey == .T, let character = operatorPendingBuffer.last {
                    element = asNormalMode.dT(to: character.character, on: focusedTextElement())               
                }
                
                if let element = element {
                    push(element: element)
                    
                    if var element = focusedTextElement() {
                        element.selectedLength = element.characterLength
                        element.selectedText = nil
                        push(element: element)
                    }
                }
            }
                            
            if operatorPendingBuffer.first?.vimKey == .f, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.f(to: character.character, on: focusedTextElement()) {
                    push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .F, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.F(to: character.character, on: focusedTextElement()) {
                    push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .r, let replacement = operatorPendingBuffer.last {                
                if let element = asNormalMode.r(with: replacement.character, on: focusedTextElement()) {
                    if element.selectedText != nil {
                        push(element: element)
                        
                        if var element = asNormalMode.h(on: focusedTextElement()) {                        
                            element.selectedLength = element.characterLength
                            push(element: element)
                        }                        
                    }
                } else {
                    post(ksNormalMode.r(with: replacement))
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .t, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.t(to: character.character, on: focusedTextElement()) {
                    push(element: element)
                }
            }
            
            if operatorPendingBuffer.first?.vimKey == .T, let character = operatorPendingBuffer.last {
                if let element = asNormalMode.T(to: character.character, on: focusedTextElement()) {
                    push(element: element)
                }
            }
            
            // yf, yF, yt, yT
            if operatorPendingBuffer.first?.vimKey == .y {
                var element: AccessibilityTextElement?
                
                if operatorPendingBuffer[1].vimKey == .f, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yf(to: character.character, on: focusedTextElement())
                }
                
                if operatorPendingBuffer[1].vimKey == .F, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yF(to: character.character, on: focusedTextElement())                    
                }
                
                if operatorPendingBuffer[1].vimKey == .t, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yt(to: character.character, on: focusedTextElement())                    
                }
                
                if operatorPendingBuffer[1].vimKey == .T, let character = operatorPendingBuffer.last {
                    element = asNormalMode.yT(to: character.character, on: focusedTextElement())                    
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
    
}


// visual mode
extension KindaVimEngine {
    
    func handleVisualMode(with keyCombination: KeyCombination) {
        switch keyCombination.vimKey {
        case .b:
            if let element = asVisualMode.b(on: focusedTextElement()) {
                push(element: element)
            }
        case .c:
            enterInsertMode()
            
            if let element = asVisualMode.c(on: focusedTextElement()) {                
                push(element: element)
            }
        case .d:
            if let element = asVisualMode.d(on: focusedTextElement()) {                
                push(element: element)
                
                if var element = focusedTextElement() {
                    element.selectedLength = element.characterLength
                    element.selectedText = nil
                    push(element: element)
                }
            } else {
                post(ksVisualMode.d())
            }
            
            enterNormalMode()
        case .e:
            if let element = asVisualMode.e(on: focusedTextElement()) {
                push(element: element)
            }
        case .G:
            if let element = asVisualMode.G(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksVisualMode.G())
            }
        case .h:
            if let element = asVisualMode.h(on: focusedTextElement()) {
                push(element: element)
            }
        case .j:
            if let element = asVisualMode.j(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksVisualMode.j())
            }
        case .k:
            if let element = asVisualMode.k(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksVisualMode.k())
            }
        case .l:
            if let element = asVisualMode.l(on: focusedTextElement()) {
                push(element: element)
            }
        case .o:
            if let element = asVisualMode.o(on: focusedTextElement()) {
                push(element: element)
            }
        case .v:
            if var element = asVisualMode.v(on: focusedTextElement()) {
                element.selectedLength = element.characterLength
                push(element: element)
            }
            
            if visualStyle == .characterwise {
                enterNormalMode()
            } else {
                visualStyle = .characterwise
            }
        case .V:
            if var element = asVisualMode.V(on: focusedTextElement()) {
                if visualStyle == .linewise {
                    element.selectedLength = element.characterLength
                }
                
                push(element: element)
            }
            
            if visualStyle == .linewise {
                enterNormalMode()
            } else {
                visualStyle = .linewise
            }
        case .y:
            if let element = asVisualMode.y(on: focusedTextElement()) {
                push(element: element)
            } else {
                post(ksVisualMode.y())
            }
            
            enterNormalMode()
        case .dollarSign:
            if let element = asVisualMode.dollarSign(on: focusedTextElement()) {
                push(element: element)
            }            
        case .escape:
            // currently a hack
            // so that we can comment multiple lines by keeping the VM selection :D
            enterInsertMode()
        case .zero:
            if let element = asVisualMode.zero(on: focusedTextElement()) {
                push(element: element)
            }  
        default:
            ()
        }
    }
    
}
