import KeyCombination


// AS Visual Mode
extension KindaVimEngine {
    
    func tryHandlingVisualModeUsingAccessibilityStrategyFirst(for keyCombination: KeyCombination, appMode: AppMode) {
        if let currentElement = focusedTextElement {


            switch keyCombination.vimKey {
            case .a:
                enterOperatorPendingForVisualMode(with: keyCombination)
            case .B:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.BForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)


                    endCurrentMove()
                case .linewise:
                    endCurrentMove()
                }
            case .b:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.bForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        endCurrentMove()

                case .linewise:
                    endCurrentMove()
                }
            case .C:
                let newElement = asVisualMode.C(on: currentElement, pgR: appMode == .pgR)
                    push(element: newElement)
                    state.lastYankStyle = .linewise
                    enterInsertMode()

            case .c:
                // TODO: push visualStyle into VimEngineState? then no need to separate like this. can separate within the AS
                // itself.
                // we are able to do that now because we're putting setting the state LYS within the moves themselves.
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.cForVisualStyleCharacterwise(on: currentElement, pgR: appMode == .pgR)
                        push(element: newElement)
                        state.lastYankStyle = .characterwise
                        enterInsertMode()

                case .linewise:
                    let newElement = asVisualMode.cForVisualStyleLinewise(on: currentElement, pgR: appMode == .pgR)
                        push(element: newElement)
                        state.lastYankStyle = .linewise
                        enterInsertMode()

                }
            case .caret:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.caretForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        endCurrentMove()

                case .linewise:
                    endCurrentMove()
                }
            case .D:
                let newElement = asVisualMode.D(on: currentElement, pgR: appMode == .pgR)
                    push(element: newElement)
                    state.lastYankStyle = .linewise
                    enterNormalMode()

            case .d:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.dForVisualStyleCharacterwise(on: currentElement, pgR: appMode == .pgR)
                        push(element: newElement)
                        state.lastYankStyle = .characterwise
                        enterNormalMode()

                case .linewise:
                    let newElement = asVisualMode.dForVisualStyleLinewise(on: currentElement, pgR: appMode == .pgR)
                        push(element: newElement)
                        state.lastYankStyle = .linewise
                        enterNormalMode()

                }
            case .dollarSign:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.dollarSignForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        endCurrentMove()

                case .linewise:
                    endCurrentMove()
                }
            case .E:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.EForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        endCurrentMove()

                case .linewise:
                    endCurrentMove()
                }
            case .e:
                switch visualStyle {
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
                switch visualStyle {
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
                switch visualStyle {
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
                switch visualStyle {
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
                switch visualStyle {
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
                switch visualStyle {
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
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.underscoreForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        endCurrentMove()

                case .linewise:
                    endCurrentMove()
                }
            case .V:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.VForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        visualStyle = .linewise
                        endCurrentMove()

                case .linewise:
                    let newElement = asVisualMode.VForVisualStyleLinewise(on: currentElement)
                        push(element: newElement)
                        enterNormalMode()

                }
            case .v:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.vForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        enterNormalMode()

                case .linewise:
                    let newElement = asVisualMode.vForVisualStyleLinewise(on: currentElement)
                        push(element: newElement)
                        visualStyle = .characterwise
                        endCurrentMove()

                }
            case .W:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.WForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        endCurrentMove()

                case .linewise:
                    endCurrentMove()
                }
            case .w:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.wForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        endCurrentMove()

                case .linewise:
                    endCurrentMove()
                }
            case .X:
                let newElement = asVisualMode.X(on: currentElement, pgR: appMode == .pgR)
                    push(element: newElement)
                    state.lastYankStyle = .linewise
                    enterNormalMode()

            case .x:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.xForVisualStyleCharacterwise(on: currentElement, pgR: appMode == .pgR)
                        push(element: newElement)
                        state.lastYankStyle = .characterwise
                        enterNormalMode()

                case .linewise:
                    let newElement = asVisualMode.xForVisualStyleLinewise(on: currentElement, pgR: appMode == .pgR)
                        push(element: newElement)
                        state.lastYankStyle = .linewise
                        enterNormalMode()

                }
            case .Y:
                let newElement = asVisualMode.Y(on: currentElement)
                    push(element: newElement)
                    state.lastYankStyle = .linewise
                    enterNormalMode()

            case .y:
                switch visualStyle {
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
                switch visualStyle {
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
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.gCaretForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        enterVisualMode()

                case .linewise:
                    enterVisualMode()
                }
            case [.g, .dollarSign]:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.gDollarSignForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        enterVisualMode()

                case .linewise:
                    enterVisualMode()
                }
            case [.g, .E]:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.gEForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        enterVisualMode()

                case .linewise:
                    enterVisualMode()
                }
            case [.g, .e]:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.geForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        enterVisualMode()

                case .linewise:
                    enterVisualMode()
                }
            case [.g, .g]:
                switch visualStyle {
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
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.gIForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        enterVisualMode()

                case .linewise:
                    enterVisualMode()
                }
            case [.g, .j]:
                switch visualStyle {
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
                switch visualStyle {
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
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.gZeroForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        enterVisualMode()

                case .linewise:
                    enterVisualMode()
                }
            case [.i, .W]:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.iWForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        enterVisualMode()

                case .linewise:
                    enterVisualMode()
                }
            case [.i, .w]:
                switch visualStyle {
                case .characterwise:
                    let newElement = asVisualMode.iwForVisualStyleCharacterwise(on: currentElement)
                        push(element: newElement)
                        enterVisualMode()

                case .linewise:
                    enterVisualMode()
                }
            default:
                switch visualStyle {
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
