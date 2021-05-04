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
    
    lazy var appComponent = AppComponent()

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        appComponent.setUp()
    }

}

