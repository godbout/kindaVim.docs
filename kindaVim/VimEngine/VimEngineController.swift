//
//  VimEngineController.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 23/04/2021.
//

import Foundation

enum VimEngineMode {
    case command
    case insert
    case operatorPending
}

class VimEngineController {
    
    static var shared = VimEngineController()
    var currentMode: VimEngineMode = .insert
    var operatorPendingBuffer = ""
    
    private init() {
        #if !TESTING
            _ = EventTapController.init()
        #endif
        
        print("engine started")
    }
    
    func transform(from keyCombination: KeyCombination) -> Bool {
        if currentMode != .operatorPending {
            switch keyCombination.vimKey {
            case .dollarSign:
                return post(KeyboardStrategy.dollarSign())
            case .underscore:
                return post(KeyboardStrategy.underscore())
            case .zero:
                return post(KeyboardStrategy.zero())
            case .a:
                enterInsertMode()

                return post(KeyboardStrategy.a())
            case .A:
                enterInsertMode()

                return post(KeyboardStrategy.A())
            case .b:
                return post(KeyboardStrategy.b())
            case .c:
                enterOperatorPendingMode(with: "c")

                return true
            case .C:
                enterInsertMode()

                return post(KeyboardStrategy.C())
            case .d:
                enterOperatorPendingMode(with: "d")

                return true
            case .g:
                enterOperatorPendingMode(with: "g")

                return true
            case .G:
                return post(KeyboardStrategy.G())
            case .h:
                if let element = AccessibilityStrategy.h(on: focusedElement()) {
                    return write(element: element)
                }

                return post(KeyboardStrategy.h())
            case .i:
                enterInsertMode()

                return true
            case .I:
                enterInsertMode()

                return post(KeyboardStrategy.I())
            case .j:
                return post(KeyboardStrategy.j())
            case .k:
                return post(KeyboardStrategy.k())
            case .l:
                if let element = AccessibilityStrategy.l(on: focusedElement()) {
                    return write(element: element)
                }

                return post(KeyboardStrategy.l())
            case .o:
                enterInsertMode()

                return post(KeyboardStrategy.o())
            case .O:
                enterInsertMode()

                return post(KeyboardStrategy.O())
            case .controlR:
                return post(KeyboardStrategy.controlR())
            case .u:
                return post(KeyboardStrategy.u())
            case .w:
                return post(KeyboardStrategy.w())
            case .x:
                return post(KeyboardStrategy.x())
            case .X:
                return post(KeyboardStrategy.X())
            default:
                return true
            }
        } else {
            switch keyCombination.key {
            case .c:
                operatorPendingBuffer.append("c")
            case .g:
                operatorPendingBuffer.append("g")
            case .d:
                operatorPendingBuffer.append("d")
            case .i:
                operatorPendingBuffer.append("i")
            case .w:
                operatorPendingBuffer.append("w")
            default:
                // TODO: handle this better
                // this is to avoid repeating the
                // resetOperatorPendingBuffer() and enterCommandMode()
                // of the default case of operatorCommand
                operatorPendingBuffer.append("69 LOL")
            }
            
            guard let operatorCommand = operatorCommand() else { return true }
                    
            return post(operatorCommand)
        }
    }
    
    private func operatorCommand() -> [KeyCombination]? {
        print(operatorPendingBuffer)
        
        switch operatorPendingBuffer {
        case "cc":
            enterInsertMode()
            
            return KeyboardStrategy.cc()
        case "gg":
            enterCommandMode()
            
            return KeyboardStrategy.gg()
        case "dd":
            enterCommandMode()
            
            return KeyboardStrategy.dd()
        case "ci":
            return []
        case "ciw":
            enterInsertMode()
            
            return KeyboardStrategy.ciw()
        default:
            resetOperatorPendingBuffer()
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
        operatorPendingBuffer = ""
    }
    
    private func enterOperatorPendingMode(with operator: String) {
        currentMode = .operatorPending
        operatorPendingBuffer.append(`operator`)
    }

    private func post(_ keyCombinations: [KeyCombination]) -> Bool {
        return KeyboardStrategy.post(keyCombinations)
    }

    private func focusedElement() -> AccessibilityElement? {
        return AccessibilityStrategy.focusedElement()
    }

    private func write(element: AccessibilityElement) -> Bool {
        return AccessibilityStrategy.write(element: element)
    }
    
}
