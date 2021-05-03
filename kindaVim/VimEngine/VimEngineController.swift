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
            switch keyCombination.key {
            case .w where keyCombination.shift == false:
                return post(KeyboardStrategy.w())
            case .k_ where keyCombination.shift == true:
                return post(KeyboardStrategy.k_())
            case .n4 where keyCombination.shift == true:
                return post(KeyboardStrategy.n4())
            case .n0 where keyCombination.shift == false:
                return post(KeyboardStrategy.n0())
            case .d where keyCombination.shift == false:
                enterOperatorPendingMode(with: "d")
                
                return true
            case .c where keyCombination.shift == false:
                enterOperatorPendingMode(with: "c")
                
                return true
            case .c where keyCombination.shift == true:
                enterInsertMode()
                
                return post(KeyboardStrategy.C())
            case .g where keyCombination.shift == false:
                enterOperatorPendingMode(with: "g")
                
                return true
            case .g where keyCombination.shift == true:
                return post(KeyboardStrategy.G())
            case .x where keyCombination.shift == false:
                return post(KeyboardStrategy.x())
            case .x where keyCombination.shift == true:
                return post(KeyboardStrategy.X())
            case .b where keyCombination.shift == false:
                return post(KeyboardStrategy.b())
            case .r where keyCombination.control == true:
                return post(KeyboardStrategy.controlR())
            case .u:
                return post(KeyboardStrategy.u())
            case .o where keyCombination.shift == false:
                enterInsertMode()
                
                return post(KeyboardStrategy.o())
            case .o where keyCombination.shift == true:
                enterInsertMode()
                
                return post(KeyboardStrategy.O())
            case .i where keyCombination.shift == false:
                enterInsertMode()

                return true
            case .i where keyCombination.shift == true:
                enterInsertMode()
                
                return post(KeyboardStrategy.I())
            case .a where keyCombination.shift == false:
                enterInsertMode()
                
                return post(KeyboardStrategy.a())
            case .a where keyCombination.shift == true:
                enterInsertMode()
                
                return post(KeyboardStrategy.A())
            case .h:
                if let element = AccessibilityStrategy.h(on: focusedElement()) {
                    return write(element: element)
                }
                
                return post(KeyboardStrategy.h())
            case .j:
                return post(KeyboardStrategy.j())
            case .k:
                return post(KeyboardStrategy.k())
            case .l:
                if let element = AccessibilityStrategy.l(on: focusedElement()) {
                    return write(element: element)
                }

                return post(KeyboardStrategy.l())
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
