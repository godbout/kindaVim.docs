import KeyCombination


// AS Visual Mode
extension KindaVimEngine {
    
    func tryHandlingVisualModeUsingAccessibilityStrategyFirst(for keyCombination: KeyCombination) {
        if let currentElement = focusedTextElement {
            switch keyCombination.vimKey {
            case .a:
                enterOperatorPendingForVisualMode(with: keyCombination)
            case .B:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.BForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    endCurrentMove()
                }
            case .b:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.bForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    endCurrentMove()
                }
            case .C:
                // TODO: synonym?
                let newElement = asVisualMode.C(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
            case .c:
                // TODO: push state.visualModeStyle into VimEngineState? then no need to separate like this. can separate within the AS
                // itself.
                // we are able to do that now because we're putting setting the state LYS within the moves themselves.
                let newElement = asVisualMode.c(on: currentElement, &state)
                push(element: newElement)
                enterInsertMode()
            case .caret:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.caretForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    endCurrentMove()
                }
            case .D:
                let newElement = asVisualMode.D(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case .d:
                let newElement = asVisualMode.d(on: currentElement, &state)
                push(element: newElement)
                enterNormalMode()
            case .dollarSign:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.dollarSignForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    endCurrentMove()
                }
            case .E:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.EForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    endCurrentMove()
                }
            case .e:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.eForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    endCurrentMove()
                }
            case .escape:
                // currently a hack
                // so that we can comment multiple lines by keeping the VM selection :D
                enterInsertMode()
            case .F:
                enterOperatorPendingForVisualMode(with: keyCombination)
            case .f:
                enterOperatorPendingForVisualMode(with: keyCombination)
            case .G:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.GForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    let newElement = asVisualMode.GForVisualStyleLinewise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                }
            case .g:
                enterOperatorPendingForVisualMode(with: keyCombination)
            case .h:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.hForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    endCurrentMove()
                }
            case .i:
                enterOperatorPendingForVisualMode(with: keyCombination)
            case .j:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.jForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    let newElement = asVisualMode.jForVisualStyleLinewise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                }
            case .k:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.kForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    let newElement = asVisualMode.kForVisualStyleLinewise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                }
            case .l:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.lForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    endCurrentMove()
                }
            case .o:
                let newElement = asVisualMode.o(on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .T:
                enterOperatorPendingForVisualMode(with: keyCombination)
            case .t:
                enterOperatorPendingForVisualMode(with: keyCombination)
            case .tilde:
                let newElement = asVisualMode.tilde(on: currentElement, state)
                push(element: newElement)
                enterNormalMode()
            case .underscore:
                let newElement = asVisualMode.underscore(on: currentElement)
                push(element: newElement)
                endCurrentMove()
            case .V:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.VForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    state.visualModeStyle = .linewise
                    endCurrentMove()
                case .linewise:
                    let newElement = asVisualMode.VForVisualStyleLinewise(on: currentElement)
                    push(element: newElement)
                    enterNormalMode()
                }
            case .v:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.vForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    enterNormalMode()
                case .linewise:
                    let newElement = asVisualMode.vForVisualStyleLinewise(on: currentElement)
                    push(element: newElement)
                    state.visualModeStyle = .characterwise
                    endCurrentMove()
                }
            case .W:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.WForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    endCurrentMove()
                }
            case .w:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.wForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    endCurrentMove()
                }
            case .X:
                // TODO: synonym?
                let newElement = asVisualMode.X(on: currentElement, &state)
                push(element: newElement)
                state.lastYankStyle = .linewise
                enterNormalMode()
            case .x:
                let newElement = asVisualMode.x(on: currentElement, &state)
                push(element: newElement)
                state.lastYankStyle = .characterwise
                enterNormalMode()
            case .Y:
                let newElement = asVisualMode.Y(on: currentElement)
                push(element: newElement)
                state.lastYankStyle = .linewise
                enterNormalMode()
            case .y:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.yForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    state.lastYankStyle = .characterwise
                    enterNormalMode()
                case .linewise:
                    let newElement = asVisualMode.yForVisualStyleLinewise(on: currentElement)
                    push(element: newElement)
                    state.lastYankStyle = .linewise
                    enterNormalMode()
                }
            case .zero:
                // endCurrentMove shouldn't be needed because we should reach 0 as
                // a Vim move rather than part of the count only when the count is already nil
                // but resetting below just as extra care and extra love.
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.zeroForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    endCurrentMove()
                case .linewise:
                    endCurrentMove()
                }
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
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.gCaretForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    enterVisualMode()
                case .linewise:
                    enterVisualMode()
                }
            case [.g, .dollarSign]:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.gDollarSignForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    enterVisualMode()
                case .linewise:
                    enterVisualMode()
                }
            case [.g, .E]:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.gEForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    enterVisualMode()
                case .linewise:
                    enterVisualMode()
                }
            case [.g, .e]:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.geForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    enterVisualMode()
                case .linewise:
                    enterVisualMode()
                }
            case [.g, .g]:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.ggForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    enterVisualMode()
                case .linewise:
                    let newElement = asVisualMode.ggForVisualStyleLinewise(on: currentElement)
                    push(element: newElement)
                    enterVisualMode()
                }
            case [.g, .I]:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.gIForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    enterVisualMode()
                case .linewise:
                    enterVisualMode()
                }
            case [.g, .j]:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.gjForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    enterVisualMode()
                case .linewise:
                    let newElement = asVisualMode.gjForVisualStyleLinewise(on: currentElement)
                    push(element: newElement)
                    enterVisualMode()
                }
            case [.g, .k]:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.gkForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    enterVisualMode()
                case .linewise:
                    let newElement = asVisualMode.gkForVisualStyleLinewise(on: currentElement)
                    push(element: newElement)
                    enterVisualMode()
                }
            case [.g, .zero]:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.gZeroForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    enterVisualMode()
                case .linewise:
                    enterVisualMode()
                }
            case [.i, .W]:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.iWForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    enterVisualMode()
                case .linewise:
                    enterVisualMode()
                }
            case [.i, .w]:
                switch state.visualModeStyle {
                case .characterwise:
                    let newElement = asVisualMode.iwForVisualStyleCharacterwise(on: currentElement)
                    push(element: newElement)
                    enterVisualMode()
                case .linewise:
                    enterVisualMode()
                }
            default:
                switch state.visualModeStyle {
                case .characterwise:
                    guard operatorPendingBuffer.first?.vimKey != .F else {
                        if let character = operatorPendingBuffer.last {
                            let newElement = asVisualMode.FForVisualStyleCharacterwise(times: count, to: character.character, on: currentElement)
                            push(element: newElement)
                            enterVisualMode()
                        }
                        
                        return
                    }
                    
                    guard operatorPendingBuffer.first?.vimKey != .f else {
                        if let character = operatorPendingBuffer.last {
                            let newElement = asVisualMode.fForVisualStyleCharacterwise(times: count, to: character.character, on: currentElement)
                            push(element: newElement)
                            enterVisualMode()
                        }
                        
                        return
                    }
                    
                    guard operatorPendingBuffer.first?.vimKey != .T else {
                        if let character = operatorPendingBuffer.last {
                            let newElement = asVisualMode.TForVisualStyleCharacterwise(times: count, to: character.character, on: currentElement)
                            push(element: newElement)
                            enterVisualMode()
                        }
                        
                        return
                    }
                    
                    guard operatorPendingBuffer.first?.vimKey != .t else {
                        if let character = operatorPendingBuffer.last {
                            let newElement = asVisualMode.tForVisualStyleCharacterwise(times: count, to: character.character, on: currentElement)
                            push(element: newElement)
                            enterVisualMode()
                        }
                        
                        return
                    }
                    
                    // if nothing gets caught, stop operator pending and go back to VM
                    enterVisualMode()
                case .linewise:
                    enterVisualMode()
                }
            }
        } else {
            parseOperatorCommandForVisualModeUsingKeyboardStrategy()
        }
    }
    
}
