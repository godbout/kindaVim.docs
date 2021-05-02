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
    
    static var shared = VimEngineController.init()
    var currentMode: VimEngineMode = .insert
    var operatorPendingBuffer = ""
    var proxy: CGEventTapProxy!
    
    private init() {
        #if !TESTING
            _ = EventTapController.init()
        #endif
        
        print("engine started")
    }
    
    func transform(from original: KeyCombination) -> Bool {
        if VimEngineController.shared.currentMode != .operatorPending {
            switch original.key {
            case .n4 where original.shift == true:
                return post(KeyboardStrategy.n4())
            case .n0 where original.shift == false:
                return post(KeyboardStrategy.n0())
            case .c where original.shift == false:
                VimEngineController.shared.enterOperatorPendingMode(with: "c")
                
                return true
            case .c where original.shift == true:
                VimEngineController.shared.enterInsertMode()
                
                return post(KeyboardStrategy.C())
            case .g where original.shift == false:
                VimEngineController.shared.enterOperatorPendingMode(with: "g")
                
                return true
            case .g where original.shift == true:
                return post(KeyboardStrategy.G())
            case .x where original.shift == false:
                return post(KeyboardStrategy.x())
            case .x where original.shift == true:
                return post(KeyboardStrategy.X())
            case .b where original.shift == false:
                return post(KeyboardStrategy.b())
            case .r where original.control == true:
                return post(KeyboardStrategy.controlR())
            case .u:
                return post(KeyboardStrategy.u())
            case .o where original.shift == false:
                VimEngineController.shared.enterInsertMode()
                
                return post(KeyboardStrategy.o())
            case .o where original.shift == true:
                VimEngineController.shared.enterInsertMode()
                
                return post(KeyboardStrategy.O())
            case .i where original.shift == false:
                VimEngineController.shared.enterInsertMode()

                return true
            case .i where original.shift == true:
                VimEngineController.shared.enterInsertMode()
                
                return post(KeyboardStrategy.I())
            case .a where original.shift == false:
                VimEngineController.shared.enterInsertMode()
                
                return post(KeyboardStrategy.a())
            case .a where original.shift == true:
                VimEngineController.shared.enterInsertMode()
                
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
                return post(KeyboardStrategy.l())
            default:
                return false
            }
        } else {
            switch original.key {
            case .c:
                operatorPendingBuffer.append("c")
            case .g:
                operatorPendingBuffer.append("g")
            default:
                ()
            }
            
            return post(operatorCommand())
        }
    }
    
    private func focusedElement() -> AXUIElement? {
        return nil
    }
    
    private func write(element: AXUIElement?) -> Bool {
        print("write new AXUIElement")
        
        return false
    }
    
    private func post(_ keyCombinations: [KeyCombination]) -> Bool {
        for keyCombination in keyCombinations {
            let cgEvent = KeyCombinationConverter.toCGEvent(from: keyCombination)
                    
            cgEvent?.tapPostEvent(proxy)
        }
        
        return true
    }
    
    private func operatorCommand() -> [KeyCombination] {
        switch operatorPendingBuffer {
        case "cc":
            VimEngineController.shared.enterInsertMode()
            
            return KeyboardStrategy.cc()
        case "gg":
            VimEngineController.shared.enterCommandMode()
            
            return KeyboardStrategy.gg()
        default:
            VimEngineController.shared.enterCommandMode()
            
            return []
        }        
    }
    
    func enterCommandMode() {
        currentMode = .command
        resetOperatorPendingBuffer()

        barbaricallyTintDisplay()
    }


    func enterInsertMode() {
        currentMode = .insert
        resetOperatorPendingBuffer()

        barbaricallyResetDisplayTint()
    }
    
    private func resetOperatorPendingBuffer() {
        operatorPendingBuffer = ""
    }
    
    private func enterOperatorPendingMode(with operator: String) {
        currentMode = .operatorPending
        operatorPendingBuffer.append(`operator`)
    }

    func barbaricallyTintDisplay() {
        let mainDisplayID = CGMainDisplayID()

        var redTable: [CGGammaValue] = [0.05, 0.7]
        var greenTable: [CGGammaValue] = [0.05, 0.7]
        var blueTable: [CGGammaValue] = [0.05, 0.7]

        CGSetDisplayTransferByTable(mainDisplayID, 2, &redTable, &greenTable, &blueTable)
    }

    func barbaricallyResetDisplayTint() {
        // barbaric for now yes
        CGDisplayRestoreColorSyncSettings()
    }
    
}
