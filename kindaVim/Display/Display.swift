//
//  Display.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 03/05/2021.
//

import Foundation

struct Display {
    
    static func tint() {
        let mainDisplayID = CGMainDisplayID()

        var redTable: [CGGammaValue] = [0.05, 0.7]
        var greenTable: [CGGammaValue] = [0.05, 0.7]
        var blueTable: [CGGammaValue] = [0.05, 0.7]

        CGSetDisplayTransferByTable(mainDisplayID, 2, &redTable, &greenTable, &blueTable)
    }
    
    static func reset() {
        CGDisplayRestoreColorSyncSettings()
    }
}
