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
    
    
    func hazeOver(_ status: HazeOverStatus) {
        switch status {
        case .on:
            hazeOverWindow.on()
        case .off:
            hazeOverWindow.off()
        }
    }
    
    func ongoingMove(add keyCombination: KeyCombination) {
        Self.ongoingMove.append(keyCombination.character)
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
