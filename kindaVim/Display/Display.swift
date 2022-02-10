import Foundation
import AppKit
import SwiftUI
import KeyCombination


struct Display {

    private var hazeOverWindow = HazeOverWindow()
    enum HazeOverStatus {
        case on
        case off
    }
    
    private var charactersWindow = CharactersWindow()
    private static var  ongoingMove: String = ""
    
    
    func hazeOver(_ status: HazeOverStatus, fullScreenMode: HazeOverFullScreenMode = .auto) {
        switch status {
        case .on:
            hazeOverWindow.on(fullScreenMode: fullScreenMode)
        case .off:
            hazeOverWindow.off()
        }
    }
    
    func ongoingMove(add keyCombination: KeyCombination) {
        if keyCombination.control == true {
            Self.ongoingMove = "⌃"
        }
                
        if keyCombination.option == true {
            Self.ongoingMove.append("⌥")
        }
        
        if keyCombination.command == true {
            Self.ongoingMove.append("⌘")
        }

        switch keyCombination.key {
        case .downArrow:
            Self.ongoingMove.append("↓")
        case .delete:
            Self.ongoingMove.append("⌫")
        case .escape:
            Self.ongoingMove.append("⎋")
        case .forwardDelete:
            Self.ongoingMove.append("⌦")
        case .leftArrow:
            Self.ongoingMove.append("←")
        case .return:
            Self.ongoingMove.append("↵")
        case .rightArrow:
            Self.ongoingMove.append("→")
        case .space:
            Self.ongoingMove.append("␣")
        case .tab:
            if keyCombination.shift == false {
                Self.ongoingMove.append("⇥")
            } else {
                Self.ongoingMove.append("⇤")
            }
        case .upArrow:
            Self.ongoingMove.append("↑")
        default:
            Self.ongoingMove.append(keyCombination.character)
        }
    }
        
    func showOngoingMove() {
        charactersWindow.show(Self.ongoingMove)
    }
    
    func resetOngoingMove() {
        Self.ongoingMove = ""
    }
    
    func fadeOutOngoingMove() {
        charactersWindow.hide()
    }
    
}
