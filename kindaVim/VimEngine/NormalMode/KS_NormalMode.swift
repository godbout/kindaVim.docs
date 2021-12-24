import KeyCombination


// KS Normal Mode
extension KindaVimEngine {
    
    func handleNormalModeUsingKeyboardStrategy(for keyCombination: KeyCombination) {         
        switch keyCombination.vimKey {
        case .A:
            post(ksNormalMode.A())
            enterInsertMode()
        case .a:
            post(ksNormalMode.a())
            enterInsertMode()
        case .b:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.bForTextElement())
            case .nonTextElement:
                post(ksNormalMode.bForNonTextElement())
            }
            
            endCurrentMove()
        case .c:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .C:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.CForTextElement())
            default:
                post(ksNormalMode.CForNonTextElement())
            }
            
            enterInsertMode()
        case .d:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .D:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.DForTextElement())
            case .nonTextElement:
                post(ksNormalMode.DForNonTextElement())
            }
            
            endCurrentMove()
        case .controlD:
            post(ksNormalMode.controlD())
            endCurrentMove()
        case .e:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.eForTextElement())
            case .nonTextElement:
                post(ksNormalMode.eForNonTextElement())
            }
            
            endCurrentMove()
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
            
            endCurrentMove()
        case .h:
            post(ksNormalMode.h())
            endCurrentMove()
        case .i:
            post(ksNormalMode.i())
            enterInsertMode()
        case .I:
            post(ksNormalMode.I())
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
        case .o:
            post(ksNormalMode.o())
            enterInsertMode()            
        case .O:
            post(ksNormalMode.O())
            enterInsertMode()
        case .p:
            post(ksNormalMode.p())
            endCurrentMove()
        case .P:
            post(ksNormalMode.P())
            endCurrentMove()
        case .r:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .controlR:
            post(ksNormalMode.controlR())
            endCurrentMove()
        case .s:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.sForTextElement())
            case .nonTextElement:
                post(ksNormalMode.sForNonTextElement())
            }

            enterInsertMode()
        case .t:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .T:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .u:
            post(ksNormalMode.u())
            endCurrentMove()
        case .controlU:
            post(ksNormalMode.controlU())
            endCurrentMove()
        case .v:            
            switch focusedElementType {
            case .textElement:
                post(ksVisualMode.vForTextElementWhenEnteringFromNormalMode())
            case .nonTextElement:
                post(ksVisualMode.vForNonTextElement())
            }
            
            visualStyle = .characterwise
            enterVisualMode()
        case .V:
            switch focusedElementType {
            case .textElement:
                post(ksVisualMode.VForTextElementWhenEnteringFromNormalMode())
            case .nonTextElement:
                post(ksVisualMode.VForNonTextElement())
            }
                        
            visualStyle = .linewise
            enterVisualMode()
        case .w:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.wForTextElement())
            case .nonTextElement:
                post(ksNormalMode.wForNonTextElement())
            }
            
            endCurrentMove()
        case .x:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.xForTextElement())
            case .nonTextElement:
                post(ksNormalMode.xForNonTextElement())
            }
            
            endCurrentMove()
        case .X:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.XForTextElement())
            case .nonTextElement:
                post(ksNormalMode.XForNonTextElement())
            }
            
            endCurrentMove()
        case .y:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .Y:
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.yyForTextElement())
            default:
                post(ksNormalMode.yyForNonTextElement())
            }

            lastYankStyle = .linewise
            endCurrentMove()
        case .escape:
            post(ksNormalMode.escape())
            enterInsertMode()            
        case .return:
            post(ksNormalMode.enter())
            enterInsertMode()
        case .caret:
            post(ksNormalMode.caret())
            endCurrentMove()
        case .dollarSign:
            post(ksNormalMode.dollarSign())
            endCurrentMove()
        case .underscore:
            post(ksNormalMode.underscore())
            endCurrentMove()
        case .zero:
            post(ksNormalMode.zero())
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
            post(ksNormalMode.gCaret())
            enterNormalMode()
        case [.g, .dollarSign]:            
            post(ksNormalMode.gDollarSign())
            enterNormalMode()
        case [.g, .e]:            
            post(ksNormalMode.ge())
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
            post(ksNormalMode.gI())
            enterInsertMode()
        case [.g, .j]:            
            post(ksNormalMode.gj())
            enterNormalMode()
        case [.g, .k]:            
            post(ksNormalMode.gk())
            enterNormalMode()
        case [.g, .underscore]:            
            post(ksNormalMode.gUnderscore())
            enterNormalMode()
        case [.g, .zero]:            
            post(ksNormalMode.gZero())
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
