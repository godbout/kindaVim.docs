//
//  SplashScreenView.swift
//  kindaVim
//
//  Created by Guillaume Leclerc on 25/10/2021.
//

import SwiftUI

struct SplashScreenView: View {
        
    var body: some View {
        Form {
            VStack {
                HStack(alignment: .top) {
                    Image(nsImage: NSImage(named: "AppIcon")!)
                    VStack(alignment: .leading) {
                        Text("blah blah blah you know the drill.")
                            .font(.headline)
                            .padding(.top)
                        Text("once you've granted Accessibility Privileges you can enter Normal Mode with Escape, or set your own Keyboard Shorcut in the Preferences.")
                            .font(.body)
                            .fixedSize(horizontal: false, vertical: true)
                            .padding(.top, 10)
                    }
                }
                .padding(.bottom, 6)
                Spacer()
                Divider()
                    .padding(.bottom, 6)
                HStack {
                    Button("Quit kindaVim") {
                        NSApp.terminate(self)
                    }
                    Spacer()
                    Button("Grant Accessibility Privileges") {
                        showAccessibilityPrivilegesPrompt()
                    }
                }        
            }
        }
        .frame(width: 480, height: 170, alignment: .center)
        .padding()
    }
    
    func showAccessibilityPrivilegesPrompt() {
        let options: NSDictionary = [kAXTrustedCheckOptionPrompt.takeRetainedValue() as NSString: true]
        
        AXIsProcessTrustedWithOptions(options)
    }
    
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
