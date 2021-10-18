import KeyCombination


// KS Normal Mode
extension KindaVimEngine {
    
    func handleNormalModeUsingKeyboardStrategy(for keyCombination: KeyCombination) {         
        switch keyCombination.vimKey {
        case .a:
            enterInsertMode()
            
            post(ksNormalMode.a())
        case .A:
            enterInsertMode()
            
            post(ksNormalMode.A())
        case .b:
            post(ksNormalMode.b())
        case .c:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .C:
            enterInsertMode()
            
            post(ksNormalMode.C())
        case .d:
            enterOperatorPendingForNormalMode(with: keyCombination)
        case .D:
            post(ksNormalMode.D())
        case .controlD:
            post(ksNormalMode.controlD())
        case .e:
            post(ksNormalMode.e())
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
            
            post(ksNormalMode.i())
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
            
            post(ksVisualMode.vForEnteringFromNormalMode())
        case .V:
            enterVisualMode()
            visualStyle = .linewise
            
            post(ksVisualMode.VForEnteringFromNormalMode())
        case .w:
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


// Operator Pending for KS Normal Mode
extension KindaVimEngine {

    func parseOperatorCommandForNormalModeUsingKeyboardStrategy() {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.c, .a]:
            ()
        case [.c, .a, .w]:
            enterNormalMode()
        case [.c, .b]:
            enterInsertMode()
            
            post(ksNormalMode.cb())
        case [.c, .c]:
            enterInsertMode()
            
            post(ksNormalMode.cc())
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
        case [.d, .a]:
            ()
        case [.d, .a, .w]:
            enterNormalMode()
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
        case [.g, .caret]:
            enterNormalMode()
            
            post(ksNormalMode.gCaret())
        case [.g, .dollarSign]:
            enterNormalMode()
            
            post(ksNormalMode.gDollarSign())
        case [.g, .e]:
            enterNormalMode()
            
            post(ksNormalMode.ge())
        case [.g, .g]:
            enterNormalMode()
                    
            switch focusedElementType {
            case .textElement:
                post(ksNormalMode.ggForTextElement())
            default:
                post(ksNormalMode.ggForNonTextElement())
            }
        case [.g, .j]:
            enterNormalMode()
            
            post(ksNormalMode.gj())
        case [.g, .k]:
            enterNormalMode()
            
            post(ksNormalMode.gk())
        case [.g, .zero]:
            enterNormalMode()
            
            post(ksNormalMode.gZero())
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
