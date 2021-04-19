//
//  AppDelegate.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 17/04/2021.
//

import Cocoa
import SwiftUI

@main
class AppDelegate: NSObject, NSApplicationDelegate {
    
    let statusItem: NSStatusItem = {
        let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
        statusItem.button?.title = "kV"
        
        let menu = NSMenu()
        menu.addItem(withTitle: "Quit", action: #selector(quit), keyEquivalent: "")
        statusItem.menu = menu
        
        return statusItem
    }()
    
    @objc func quit() {
        NSApplication.shared.terminate(self)
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

