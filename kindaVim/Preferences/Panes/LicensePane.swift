import SwiftUI
import Foundation


struct PaddleAPI: Codable {
    
    let success: Bool
    
    struct Response: Codable {
        
        struct Subscription: Codable {
            let subscription_id: Int
            let status: String
        }
        
        let subscription: Subscription
    }
        
    let response: [Response]
    
}


struct LicensePane: View {
    
    @Environment(\.openURL) private var openURL
    
    @State private var awesomeHumanEmail = AppCore.shared.licensing.paddleProduct?.activationEmail ?? ""
    @State private var magicNumbers = AppCore.shared.licensing.paddleProduct?.licenseCode ?? ""
    @State private var isActivated = AppCore.shared.licensing.isActivated
    @State private var activateSubscriptionButtonText = "activate subscription" 
    @State private var removeLicenseButtonText = "remove license" 
    @State private var recoverOrdersButtonText = "recover orders"
    @State private var manageSubscriptionButtonText = "manage subscription"
    
    var body: some View {
        
        Form {
            VStack {
                HStack(alignment: .top) {
                    VStack {
                        Image(systemName: "alarm")
                            .font(.system(size: 64))
                            .foregroundColor(isActivated ? .primary : .gray)
                            .opacity(isActivated ? 1 : 0.1)
                            .padding(.vertical, 7)
                        Button(action: { tryRemovingLicense()} ) {
                            Text(removeLicenseButtonText)
                                .frame(width: 92)
                        }
                        .disabled(removeLicenseButtonText == "removing...")
                        .opacity(isActivated ? 1 : 0)
                    }
                    .padding(.trailing, 41)
                    VStack(alignment: .leading) {
                        Text("One of These Days™ kV will be sleeping from 5am to 1pm (Winter schedule) every day. at this time you may get a No Bedtime™ subscription if you wish to torture kV 24 hours a day.")
                            .padding(.bottom)
                        Text("currently kV is still young and can handle the pressure. so please abuse it freely.")
                    }
                    .fixedSize(horizontal: false, vertical: true)
                }
                .padding(.bottom)
            
                Divider()
                
                VStack {
                    HStack {
                        Spacer()
                        
                        TextField(
                            text: Binding(
                                get: { self.awesomeHumanEmail },
                                set: { 
                                    let trimmedEmail = $0.trimmingCharacters(in: .whitespacesAndNewlines)
                                    self.awesomeHumanEmail = trimmedEmail
                                }
                            ),
                            prompt: Text("guill@sleeplessmind.com.mo")
                        ) {
                            Label("the Awesome Human's email:", systemImage: "figure.walk")
                        }
                        .onSubmit {
                            tryActivatingLicense()
                        }
                        .disabled(isActivated)
                        .multilineTextAlignment(.center)
                        .frame(width: 512)
                        .fixedSize()
                    }
                    HStack {
                        Spacer()
                        TextField(
                            text: Binding(
                                get: { self.magicNumbers },
                                set: {
                                    let trimmedLicense = $0.trimmingCharacters(in: .whitespacesAndNewlines)
                                    self.magicNumbers = trimmedLicense
                                }
                            ),
                            prompt: Text("PD-a1bcde2f-3ghi-4567-j8kl-m901234n6o9f")
                        ) {
                            Label("the Magic Numbers™:", systemImage: "barcode")
                        }
                        .onSubmit {
                            tryActivatingLicense()
                        }
                        .disabled(isActivated)
                        .multilineTextAlignment(.center)
                        .frame(width: 470)
                        .fixedSize()
                    }
                    HStack {
                        Spacer()
                        
                        if isActivated {
                            Spacer() 
                            Button(action: { sendAwesomeHumanToSubscriptionManagementPage() }) {
                                Text(manageSubscriptionButtonText)
                                    .frame(width: 128)
                            }                                
                            .disabled(manageSubscriptionButtonText == "generating link...")
                        } else {
                            Button(action: { tryActivatingLicense() }) {
                                Text(activateSubscriptionButtonText)
                                    .frame(width: 128)
                            }
                            .disabled(awesomeHumanEmail.isEmpty || magicNumbers.isEmpty || activateSubscriptionButtonText == "activating...")
                        }
                    }
                    VStack {
                        HStack(alignment: .bottom) {
                            Spacer()
                            Text("to manage your sub you'll need your Order / Receipt #. get an email if you've lost them.")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            
                            Button(action: { tryRecoveringOrders() }) {
                                Text(recoverOrdersButtonText)
                                    .frame(width: 92)
                            }
                        }
                        .disabled(awesomeHumanEmail.isEmpty || recoverOrdersButtonText == "sending email...")                        
                        HStack(alignment: .bottom) {
                            Spacer()
                            Text("sending you to a secure page online. fill the form and get your license by email.")
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Button(action: { sendAwesomeHumanToLicenseCodeRecoveryPage() }) {
                                Text("recover license")
                                    .frame(width: 92)
                            }
                        }
                        .disabled(awesomeHumanEmail.isEmpty || isActivated)
                    }
                    .padding(.top, 15)                                     
                }
                .padding(.top, 12)          
//                .disabled(true)
//                .foregroundColor(.gray)
            }
        }
        .frame(width: 570, height: nil)
        .padding(10)
    }
    
    private func tryActivatingLicense() {
        guard awesomeHumanEmail.isNotEmpty, magicNumbers.isNotEmpty else { return }
        
        activateSubscriptionButtonText = "activating..."
        
        AppCore.shared.licensing.paddleProduct?.activateEmail(awesomeHumanEmail, license: magicNumbers) { success, _ in
            if success {
                isActivated = true
            }
            
            activateSubscriptionButtonText = "activate subscription"
        }
    }
        
    private func tryRemovingLicense() {
        removeLicenseButtonText = "removing..."
                
        AppCore.shared.licensing.paddleProduct?.deactivate() { success, _ in
            awesomeHumanEmail = ""
            magicNumbers = ""
            isActivated = false
            removeLicenseButtonText = "remove license"
        }
    }
    
    private func tryRecoveringOrders() {
        recoverOrdersButtonText = "sending email..."
        
        AppCore.shared.licensing.paddle?.recoverLicense(for: AppCore.shared.licensing.paddleProduct!, email: awesomeHumanEmail) { _, _ in
            recoverOrdersButtonText = "recover orders"
        }
    }
    
    private func sendAwesomeHumanToSubscriptionManagementPage() {
        openURL(URL(string: "https://kindavim.app/manage/" + awesomeHumanEmail)!)
    }
    
    private func sendAwesomeHumanToLicenseCodeRecoveryPage() {
        openURL(URL(string: "https://kindavim.app/recover/" + awesomeHumanEmail)!)
    }
    
}


struct LicensePane_Previews: PreviewProvider {
    
    static var previews: some View {
        LicensePane()
    }
        
}
