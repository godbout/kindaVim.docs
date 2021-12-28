import KeyCombination


// KS Normal Mode
extension KindaVimEngine {
    
    func handleNormalModeUsingKeyboardStrategy(for keyCombination: KeyCombination) {         
        switch keyCombination.vimKey {
        case .A:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.AForTextElement())
            default:
                post(ksNormalMode.AForNonTextElement())
            }
            
            enterInsertMode()
        case .a:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.aForTextElement())
            default:
                post(ksNormalMode.aForNonTextElement())
            }
            
            enterInsertMode()
        case .b:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.bForTextElement())
            case .nonTextElement:
                post(ksNormalMode.bForNonTextElement())
            }
            
            endCurrentMove()
        case .C:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.CForTextElement())
            default:
                post(ksNormalMode.CForNonTextElement())
            }
            
            enterInsertMode()
        case .c:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .caret:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.caretForTextElement())
            case .nonTextElement:
                post(ksNormalMode.caretForNonTextElement())
            }
            
            endCurrentMove()
        case .controlB:
            post(ksNormalMode.controlB())
            endCurrentMove()
        case .controlD:
            post(ksNormalMode.controlD())
            endCurrentMove()
        case .controlF:
            post(ksNormalMode.controlF())
            endCurrentMove()
        case .controlR:
            post(ksNormalMode.controlR())
            endCurrentMove()
        case .controlU:
            post(ksNormalMode.controlU())
            endCurrentMove()
        case .D:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.DForTextElement())
            case .nonTextElement:
                post(ksNormalMode.DForNonTextElement())
            }
            
            endCurrentMove()
        case .d:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .dollarSign:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.dollarSignForTextElement())
            case .nonTextElement:
                post(ksNormalMode.dollarSignForNonTextElement())
            }
            
            endCurrentMove()
        case .e:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.eForTextElement())
            case .nonTextElement:
                post(ksNormalMode.eForNonTextElement())
            }
            
            endCurrentMove()
        case .escape:
            post(ksNormalMode.escape())
            enterInsertMode()            
        case .F:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .f:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .G:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.GForTextElement())
            case .nonTextElement:
                post(ksNormalMode.GForNonTextElement())
            }
            
            endCurrentMove()
        case .g:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .h:
            post(ksNormalMode.h())
            endCurrentMove()
        case .I:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.IForTextElement())
            default:
                post(ksNormalMode.IForNonTextElement())
            }
                        
            enterInsertMode()
        case .i:
            post(ksNormalMode.i())
            enterInsertMode()
        case .j:
            post(ksNormalMode.j())
            endCurrentMove()
        case .k:
            post(ksNormalMode.k())
            endCurrentMove()
        case .l:
            post(ksNormalMode.l(times: count))
            endCurrentMove()
        case .O:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.OForTextElement())
            default:
                post(ksNormalMode.OForNonTextElement())
            }
                        
            enterInsertMode()
        case .o:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.oForTextElement())
            default:
                post(ksNormalMode.oForNonTextElement())
            }
                        
            enterInsertMode()
        case .P:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.PForTextElement())
            case .nonTextElement:
                post(ksNormalMode.PForNonTextElement())
            }
            
            endCurrentMove()
        case .p:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.pForTextElement())
            case .nonTextElement:
                post(ksNormalMode.pForNonTextElement())
            }
            
            endCurrentMove()
        case .r:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .return:
            post(ksNormalMode.enter())
            enterInsertMode()
        case .s:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.sForTextElement())
            case .nonTextElement:
                post(ksNormalMode.sForNonTextElement())
            }

            enterInsertMode()
        case .T:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .t:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .u:
            post(ksNormalMode.u())
            endCurrentMove()
        case .underscore:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.underscoreForTextElement())
            case .nonTextElement:
                post(ksNormalMode.underscoreForNonTextElement())
            }
            
            endCurrentMove()
        case .V:
            switch focusedElementType {
            case .textElement:
                post(ksVisualMode.VForTextElementWhenEnteringFromNormalMode())
            case .nonTextElement:
                post(ksVisualMode.VForNonTextElement())
            }
                        
            visualStyle = .linewise
            enterVisualMode()
        case .v:            
            switch focusedElementType {
            case .textElement:
                post(ksVisualMode.vForTextElementWhenEnteringFromNormalMode())
            case .nonTextElement:
                post(ksVisualMode.vForNonTextElement())
            }
            
            visualStyle = .characterwise
            enterVisualMode()
        case .w:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.wForTextElement())
            case .nonTextElement:
                post(ksNormalMode.wForNonTextElement())
            }
            
            endCurrentMove()
        case .X:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.XForTextElement())
            case .nonTextElement:
                post(ksNormalMode.XForNonTextElement())
            }
            
            lastYankStyle = .characterwise
            endCurrentMove()
        case .x:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.xForTextElement())
            case .nonTextElement:
                post(ksNormalMode.xForNonTextElement())
            }
            
            lastYankStyle = .characterwise
            endCurrentMove()
        case .Y:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.yyForTextElement())
            default:
                post(ksNormalMode.yyForNonTextElement())
            }

            lastYankStyle = .linewise
            endCurrentMove()
        case .y:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .zero:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.zeroForTextElement())
            case .nonTextElement:
                post(ksNormalMode.zeroForNonTextElement())
            }
            
            endCurrentMove()
        default:
            endCurrentMove()
        }
    }
    
}


// Operator Pending for KS Normal Mode
extension KindaVimEngine {

    func parseOperatorCommandForNormalModeUsingKeyboardStrategy() {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.c, .a]:
            ()
        case [.c, .a, .w]:
            enterNormalMode()
        case [.c, .b]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.cbForTextElement())
            default:
                post(ksNormalMode.cbForNonTextElement())
            }
                        
            enterInsertMode()
        case [.c, .c]:            
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.ccForTextElement())
            default:
                post(ksNormalMode.ccForNonTextElement())
            }
                        
            enterInsertMode()
        case [.c, .e]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.ceForTextElement())
            default:
                post(ksNormalMode.ceForNonTextElement())
            }
                        
            enterInsertMode()
        case [.c, .g]:
            ()
        case [.c, .g, .g]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.cggForTextElement())
            default:
                post(ksNormalMode.cggForNonTextElement())
            }
                        
            enterInsertMode()
        case [.c, .G]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.cGForTextElement())
            default:
                post(ksNormalMode.cGForNonTextElement())
            }
            
            enterInsertMode()
        case [.c, .i]:
            ()
        case [.c, .i, .w]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.ciwForTextElement())
            default:
                post(ksNormalMode.ciwForNonTextElement())
            }
                        
            enterInsertMode()
        case [.c, .w]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.cwForTextElement())
            default:
                post(ksNormalMode.cwForNonTextElement())
            }
                        
            enterInsertMode()
        case [.colon, .q]:
            ()
        case [.colon, .q, .return]:
            post(commandLineMode.q())
            enterInsertMode()
        case [.colon, .w]:
            ()
        case [.colon, .w, .return]:
            post(commandLineMode.w())
            enterNormalMode()
        case [.colon, .w, .q]:
            ()
        case [.colon, .w, .q, .return]:
            post(commandLineMode.wq())
            enterInsertMode()
        case [.d, .a]:
            ()
        case [.d, .a, .w]:
            enterNormalMode()
        case [.d, .b]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.dbForTextElement())
            default:
                post(ksNormalMode.dbForNonTextElement())
            }
            
            enterNormalMode()
        case [.d, .d]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.ddForTextElement())
            default:
                post(ksNormalMode.ddForNonTextElement())
            }
            
            lastYankStyle = .linewise
            enterNormalMode()
        case [.d, .e]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.deForTextElement())
            default:
                post(ksNormalMode.deForNonTextElement())
            }
            
            enterNormalMode()
        case [.d, .g]:
            ()
        case [.d, .g, .g]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.dggForTextElement())
            default:
                post(ksNormalMode.dggForNonTextElement())
            }

            enterNormalMode()            
        case [.d, .G]:            
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.dGForTextElement())
            default:
                post(ksNormalMode.dGForNonTextElement())
            }
            
            enterNormalMode()
        case [.d, .h]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.dhForTextElement())
            default:
                post(ksNormalMode.dhForNonTextElement())
            }
            
            lastYankStyle = .characterwise
            enterNormalMode()
        case [.d, .j]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.djForTextElement())
            default:
                post(ksNormalMode.djForNonTextElement())
            }
            
            enterNormalMode()
        case [.d, .k]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.dkForTextElement())
            default:
                post(ksNormalMode.dkForNonTextElement())
            }
            
            enterNormalMode()
        case [.d, .l]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.dlForTextElement())
            default:
                post(ksNormalMode.dlForNonTextElement())
            }
            
            lastYankStyle = .characterwise
            enterNormalMode()
        case [.d, .w]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.dwForTextElement())
            default:
                post(ksNormalMode.dwForNonTextElement())
            }
            
            enterNormalMode()
        case [.g, .caret]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.gCaretForTextElement())
            default:
                post(ksNormalMode.gCaretForNonTextElement())
            }
            
            enterNormalMode()
        case [.g, .dollarSign]:            
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.gDollarSignForTextElement())
            default:
                post(ksNormalMode.gDollarSignForNonTextElement())
            }
            
            enterNormalMode()
        case [.g, .e]:            
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.geForTextElement())
            default:
                post(ksNormalMode.geForNonTextElement())
            }
            
            enterNormalMode()
        case [.g, .g]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.ggForTextElement())
            default:
                post(ksNormalMode.ggForNonTextElement())
            }
            
            enterNormalMode()
        case [.g, .I]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.gIForTextElement())
            default:
                post(ksNormalMode.gIForNonTextElement())
            }
            
            enterInsertMode()
        case [.g, .j]:            
            post(ksNormalMode.gj())
            enterNormalMode()
        case [.g, .k]:            
            post(ksNormalMode.gk())
            enterNormalMode()
        case [.g, .underscore]:            
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.gUnderscoreForTextElement())
            default:
                post(ksNormalMode.gUnderscoreForNonTextElement())
            }
            
            enterNormalMode()
        case [.g, .zero]:            
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.gZeroForTextElement())
            default:
                post(ksNormalMode.gZeroForNonTextElement())
            }
            
            enterNormalMode()
        case [.y, .i]:
            ()
        case [.y, .i, .w]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.yiwForTextElement())
            default:
                post(ksNormalMode.yiwForNonTextElement())
            }
            
            lastYankStyle = .characterwise
            enterNormalMode()
        case [.y, .y]:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.yyForTextElement())
            default:
                post(ksNormalMode.yyForNonTextElement())
            }
                        
            lastYankStyle = .linewise
            enterNormalMode()
        default:
            if operatorPendingBuffer.first?.vimKey == .r, let replacement = operatorPendingBuffer.last {                
                switch focusedElementType {
                case .textElement:
                    post(ksNormalMode.rForTextElement(with: replacement))
                default:
                    post(ksNormalMode.rForNonTextElement(with: replacement))
                }
            }
            
            // if we don't recognize any operator move
            // then we go back to normal mode
            // and the operator pending buffer will be resetted
            enterNormalMode()
        }
    }
    
}
