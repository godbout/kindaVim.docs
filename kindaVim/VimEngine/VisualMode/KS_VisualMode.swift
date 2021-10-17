import KeyCombination


// KS Visual Mode
extension KindaVimEngine {
    
    func handleVisualModeUsingKeyboardStrategy(for keyCombination: KeyCombination) {
        switch keyCombination.vimKey {
        case .a:
            enterOperatorPendingForVisualMode(with: keyCombination)
        case .b:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.b())
            case .linewise:
                ()
            }
        case .d:
            post(ksVisualMode.d())
            
            enterNormalMode()
        case .e:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.e())
            case .linewise:
                ()
            }
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
        case .i:
            enterOperatorPendingForVisualMode(with: keyCombination)
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


// Operator Pending for KS Visual Mode
extension KindaVimEngine {
    
    func parseOperatorCommandForVisualModeUsingKeyboardStrategy() {
        switch operatorPendingBuffer.map({ $0.vimKey }) {
        case [.g, .dollarSign]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.gDollarSign())
            case .linewise:
                ()
            }
            
            enterVisualMode()
        case [.g, .e]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.ge())
            case .linewise:
                ()
            }
            
            enterVisualMode()
        case [.g, .g]:
            post(ksVisualMode.gg())
            
            enterVisualMode()
        case [.g, .j]:
            post(ksVisualMode.gj())
            
            enterVisualMode()
        case [.g, .k]:
            post(ksVisualMode.gk())
            
            enterVisualMode()
        case [.g, .zero]:
            switch visualStyle {
            case .characterwise:
                post(ksVisualMode.gZero())
            case .linewise:
                ()
            }
            
            enterVisualMode()
        default:
            // if we don't recognize any operator move
            // go back to visual mode
            enterVisualMode()
        }
    }
    
}
