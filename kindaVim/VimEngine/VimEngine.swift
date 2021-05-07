import Foundation

enum VimEngineMode {
    case command
    case insert
    case operatorPending
}

class VimEngine {
    
    static var shared = VimEngine()
    
    private(set) var currentMode: VimEngineMode = .insert
    private(set) var operatorPendingBuffer = [VimKey]()

    var keyboardStrategy: KeyboardStrategyProtocol = KeyboardStrategy()
    var accessibilityStrategy: AccessibilityStrategyProtocol = AccessibilityStrategy()

    private init() {
        #if !TESTING
            _ = EventTapController.init()
        #endif
        
        print("engine started")
    }
    
    func handle(keyCombination: KeyCombination) {
        if currentMode != .operatorPending {
            switch keyCombination.vimKey {
            case .dollarSign:
                post(keyboardStrategy.dollarSign())
            case .underscore:
                post(keyboardStrategy.underscore())
            case .zero:
                post(keyboardStrategy.zero())
            case .a:
                enterInsertMode()

                post(keyboardStrategy.a())
            case .A:
                enterInsertMode()

                post(keyboardStrategy.A())
            case .b:
                post(keyboardStrategy.b())
            case .c:
                enterOperatorPendingMode(with: .c)
            case .C:
                enterInsertMode()

                post(keyboardStrategy.C())
            case .d:
                enterOperatorPendingMode(with: .d)
            case .controlD:
                post(keyboardStrategy.controlD())
            case .g:
                enterOperatorPendingMode(with: .g)
            case .G:
                post(keyboardStrategy.G())
            case .h:
                // ugly af; need to refactor
                if let element = accessibilityStrategy.h(on: focusedElement()) {
                    if write(element: element) == false {
                        post(keyboardStrategy.h())
                    }
                } else {
                    post(keyboardStrategy.h())
                }
            case .i:
                enterInsertMode()
            case .I:
                enterInsertMode()

                post(keyboardStrategy.I())
            case .j:
                post(keyboardStrategy.j())
            case .k:
                post(keyboardStrategy.k())
            case .l:
                // ugly af; need to refactor
                if let element = accessibilityStrategy.l(on: focusedElement()) {
                    if write(element: element) == false {
                        post(keyboardStrategy.l())
                    }
                } else {
                    post(keyboardStrategy.l())
                }
            case .o:
                enterInsertMode()

                post(keyboardStrategy.o())
            case .O:
                enterInsertMode()

                post(keyboardStrategy.O())
            case .controlR:
                post(keyboardStrategy.controlR())
            case .u:
                post(keyboardStrategy.u())
            case .controlU:
                post(keyboardStrategy.controlU())
            case .w:
                post(keyboardStrategy.w())
            case .x:
                post(keyboardStrategy.x())
            case .X:
                post(keyboardStrategy.X())
            case .y:
                enterOperatorPendingMode(with: .y)
            default:
                ()
            }
        } else {
            switch keyCombination.vimKey {
            case .a:
                fallthrough
            case .c:
                fallthrough
            case .d:
                fallthrough
            case .g:
                fallthrough
            case .G:
                fallthrough
            case .i:
                fallthrough
            case .w:
                fallthrough
            case .y:
                operatorPendingBuffer.append(keyCombination.vimKey!)
            default:
                resetOperatorPendingBuffer()
            }

            if let operatorCommand = operatorCommand() {
                post(operatorCommand)
            }
        }
    }
    
    private func operatorCommand() -> [KeyCombination]? {
        print(operatorPendingBuffer)
        
        switch operatorPendingBuffer {
        case [.c, .a]:
            return nil
        case [.c, .a, .w]:
            return nil
        case [.c, .c]:
            enterInsertMode()
            
            return keyboardStrategy.cc()
        case [.c, .g]:
            return nil
        case [.c, .g, .g]:
            enterInsertMode()

            return keyboardStrategy.cgg()
        case [.c, .G]:
            enterInsertMode()
            
            return keyboardStrategy.cG()
        case [.c, .i]:
            return nil
        case [.c, .i, .w]:
            enterInsertMode()

            return keyboardStrategy.ciw()
        case [.d, .a]:
            return nil
        case [.d, .a, .w]:
            return nil
        case [.d, .d]:
            enterCommandMode()

            return keyboardStrategy.dd()
        case [.d, .i]:
            return nil
        case [.d, .i, .w]:
            return nil
        case [.d, .G]:
            enterCommandMode()
            
            return keyboardStrategy.dG()
        case [.g, .g]:
            enterCommandMode()
            
            return keyboardStrategy.gg()
        case [.y, .i]:
            return nil
        case [.y, .i, .w]:
            enterCommandMode()

            return keyboardStrategy.yiw()
        case [.y, .y]:
            enterCommandMode()

            return keyboardStrategy.yy()
        default:
            enterCommandMode()
            
            return nil
        }        
    }
    
    func enterCommandMode() {
        currentMode = .command
        resetOperatorPendingBuffer()

        Display.tint()
    }


    func enterInsertMode() {
        currentMode = .insert
        resetOperatorPendingBuffer()

        Display.reset()
    }
    
    private func resetOperatorPendingBuffer() {
        operatorPendingBuffer = []
    }
    
    private func enterOperatorPendingMode(with vimKey: VimKey) {
        currentMode = .operatorPending
        operatorPendingBuffer.append(vimKey)
    }

    private func post(_ keyCombinations: [KeyCombination]) {
        KeyboardStrategy.post(keyCombinations)
    }

    private func focusedElement() -> AccessibilityElement? {
        return AccessibilityStrategy.focusedElement()
    }

    private func write(element: AccessibilityElement) -> Bool {
        return AccessibilityStrategy.write(element: element)
    }
    
}
