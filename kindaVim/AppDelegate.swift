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
    
    var statusBarController: StatusBarController!

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        statusBarController = StatusBarController()
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

}

