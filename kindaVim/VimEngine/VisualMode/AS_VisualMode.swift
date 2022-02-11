import KeyCombination


// AS Visual Mode
extension KindaVimEngine {
    
    func tryHandlingVisualModeUsingAccessibilityStrategyFirst(for keyCombination: KeyCombination) {
        if let currentElement = focusedTextElement {
            switch keyCombination.vimKey {
            case .a:
                enterOperatorPendingForVisualMode(with: keyCombination)
            case .B:
                let newElement = asVisualMode.B(on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            case .b:
                let newElement = asVisualMode.b(on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            case .backspace:
                let newElement = asVisualMode.h(on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            case .C:
                let newElement = asVisualMode.C(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
            case .c:
                let newElement = asVisualMode.c(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
            case .caret:
                let newElement = asVisualMode.caret(on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            case .D:
                let newElement = asVisualMode.D(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case .d:
                let newElement = asVisualMode.d(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case .dollarSign:
                let newElement = asVisualMode.dollarSign(on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            case .E:
                let newElement = asVisualMode.E(on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            case .e:
                let newElement = asVisualMode.e(on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            case .escape:
                let newElement = asVisualMode.escape(on: currentElement)
                push(element: newElement)
                enterNormalMode()
            case .F:
                enterOperatorPendingForVisualMode(with: keyCombination)
            case .f:
                enterOperatorPendingForVisualMode(with: keyCombination)
            case .G:
                let newElement = asVisualMode.G(on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            case .g:
                enterOperatorPendingForVisualMode(with: keyCombination)
            case .h:
                let newElement = asVisualMode.h(on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            case .i:
                enterOperatorPendingForVisualMode(with: keyCombination)
            case .j:
                if currentElement.role == .textArea {
                    let newElement = asVisualMode.j(on: currentElement, state)
                    push(element: newElement)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .k:
                if currentElement.role == .textArea {
                    let newElement = asVisualMode.k(on: currentElement, state)
                    push(element: newElement)
                    endCurrentMove()
                } else {
                    handleVisualModeUsingKeyboardStrategy(for: keyCombination)
                }
            case .l:
                let newElement = asVisualMode.l(on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            case .o:
                let newElement = asVisualMode.o(on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .R:
                let newElement = asVisualMode.R(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()  
            case .S:
                let newElement = asVisualMode.S(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()  
            case .s:
                let newElement = asVisualMode.c(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()    
            case .T:
                enterOperatorPendingForVisualMode(with: keyCombination)
            case .t:
                enterOperatorPendingForVisualMode(with: keyCombination)
            case .tilde:
                let newElement = asVisualMode.tilde(on: currentElement, state)
                push(element: newElement)
                enterNormalMode()
            case .underscore:
                let newElement = asVisualMode.underscore(on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            case .V:
                let newElement = asVisualMode.VFromVisualMode(on: currentElement, state)
                push(element: newElement)
                
                switch state.visualStyle {
                case .characterwise:
                    state.visualStyle = .linewise
                    endCurrentMove()
                case .linewise:
                    enterNormalMode()
                }
            case .v:
                let newElement = asVisualMode.vFromVisualMode(on: currentElement, state)
                push(element: newElement)
                
                switch state.visualStyle {
                case .characterwise:
                    enterNormalMode()
                case .linewise:
                    state.visualStyle = .characterwise
                    endCurrentMove()
                }
            case .W:
                let newElement = asVisualMode.W(on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            case .w:
                let newElement = asVisualMode.w(on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            case .X:
                let newElement = asVisualMode.D(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case .x:
                let newElement = asVisualMode.d(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case .Y:
                let newElement = asVisualMode.Y(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case .y:
                let newElement = asVisualMode.y(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case .zero:
                // endCurrentMove shouldn't be needed because we should reach 0 as
                // a Vim move rather than part of the count only when the count is already nil
                // but resetting below just as extra care and extra love.
                let newElement = asVisualMode.zero(on: currentElement, state)
                push(element: newElement)
                endCurrentMove()
            default:
                ()
            }
        } else {
            handleVisualModeUsingKeyboardStrategy(for: keyCombination)
        }
    }
    
}


// Operator Pending for AS Visual Mode
extension KindaVimEngine {
    
    func tryParsingOperatorCommandForVisualModeUsingAccessibilityStrategyFirst() {
        if let currentElement = focusedTextElement {
            switch operatorPendingBuffer.map({ $0.vimKey }) {
            case [.g, .caret]:
                let newElement = asVisualMode.gCaret(on: currentElement, state)
                push(element: newElement)
                enterVisualMode()
            case [.g, .dollarSign]:
                let newElement = asVisualMode.gDollarSign(on: currentElement, state)
                push(element: newElement)
                enterVisualMode()
            case [.g, .E]:
                let newElement = asVisualMode.gE(on: currentElement, state)
                push(element: newElement)
                enterVisualMode()
            case [.g, .e]:
                let newElement = asVisualMode.ge(on: currentElement, state)
                push(element: newElement)
                enterVisualMode()
            case [.g, .g]:
                let newElement = asVisualMode.gg(on: currentElement, state)
                push(element: newElement)
                enterVisualMode()
            case [.g, .I]:
                let newElement = asVisualMode.gI(on: currentElement, state)
                push(element: newElement)
                enterVisualMode()
            case [.g, .j]:
                if currentElement.role == .textArea {
                    let newElement = asVisualMode.gj(on: currentElement, state)
                    push(element: newElement)
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }
            case [.g, .k]:
                if currentElement.role == .textArea {
                    let newElement = asVisualMode.gk(on: currentElement, state)
                    push(element: newElement)
                    enterVisualMode()
                } else {
                    parseOperatorCommandForVisualModeUsingKeyboardStrategy()
                }
            case [.g, .zero]:
                let newElement = asVisualMode.gZero(on: currentElement, state)
                push(element: newElement)
                enterVisualMode()
            case [.i, .p]:
                let newElement = asVisualMode.ip(on: currentElement, state)
                push(element: newElement)
                state.visualStyle = .linewise
                enterVisualMode()
            case [.i, .W]:
                let newElement = asVisualMode.iW(on: currentElement, state)
                push(element: newElement)
                enterVisualMode()
            case [.i, .w]:
                let newElement = asVisualMode.iw(on: currentElement, state)
                push(element: newElement)
                enterVisualMode()
            default:
                guard operatorPendingBuffer.first?.vimKey != .F else {
                    if let character = operatorPendingBuffer.last {
                        let newElement = asVisualMode.F(times: count, to: character.character, on: currentElement, state)
                        push(element: newElement)
                        enterVisualMode()
                    }
                    
                    return
                }
                
                guard operatorPendingBuffer.first?.vimKey != .f else {
                    if let character = operatorPendingBuffer.last {
                        let newElement = asVisualMode.f(times: count, to: character.character, on: currentElement, state)
                        push(element: newElement)
                        enterVisualMode()
                    }
                    
                    return
                }
                
                guard operatorPendingBuffer.first?.vimKey != .T else {
                    if let character = operatorPendingBuffer.last {
                        let newElement = asVisualMode.T(times: count, to: character.character, on: currentElement, state)
                        push(element: newElement)
                        enterVisualMode()
                    }
                    
                    return
                }
                
                guard operatorPendingBuffer.first?.vimKey != .t else {
                    if let character = operatorPendingBuffer.last {
                        let newElement = asVisualMode.t(times: count, to: character.character, on: currentElement, state)
                        push(element: newElement)
                        enterVisualMode()
                    }
                    
                    return
                }
                
                // if nothing gets caught, stop operator pending and go back to VM
                enterVisualMode()
            }
        } else {
            parseOperatorCommandForVisualModeUsingKeyboardStrategy()
        }
    }
    
}
