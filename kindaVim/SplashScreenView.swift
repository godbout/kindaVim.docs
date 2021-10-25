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
            Text("blah blah blah yaddi yaddi yadda you know the drill. once you're granting Accessibility Privileges we will send you to the Preferences.")
            Button("Grant Accessibility Privileges") {
                showAccessibilityPrivilegesPrompt()
            }
        }
        .frame(width: 480, height: 640, alignment: .center)
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
