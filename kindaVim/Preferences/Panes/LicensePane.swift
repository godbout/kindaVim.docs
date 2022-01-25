import SwiftUI


struct LicensePane: View {
    
    @AppStorage(SettingsKeys.awesomeHumanEmail) private var awesomeHumanEmail = ""
    @AppStorage(SettingsKeys.magicNumbers) private var magicNumbers = ""
    
    @State private var isActivated = AppCore.shared.licensing.isActivated
    @State private var activateSubscriptionButtonText = "activate subscription" 
    @State private var removeLicenseButtoNText = "remove license" 
    
    var body: some View {
        
        Form {
            VStack {
                HStack {
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("One of These Days™ kV will be sleeping from 5am to 1pm (Winter schedule) every day. at this time you may get a No Bedtime™ subscription if you wish to torture kV 24 hours a day.")
                            .padding(.bottom)
                        Text("currently kV is still young and can handle the pressure. so please abuse it freely.")
                    }
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.bottom)
                    Spacer()
                }
            
                Divider()
                
                VStack(alignment: .trailing) {
                    VStack {
                        HStack {
                            Spacer()
                            TextField(text: $awesomeHumanEmail, prompt: Text("guill@sleeplessmind.com.mo")) {
                                Label("the Awesome Human's email:", systemImage: "figure.walk")
                            }
                            .onSubmit {
                                tryActivatingLicense()
                            }
                            .multilineTextAlignment(.center)
                            .frame(width: 512)
                            .fixedSize()
                        }
                        HStack {
                            Spacer()
                            TextField(text: $magicNumbers, prompt: Text("PD-a1bcde2f-3ghi-4567-j8kl-m901234n6o9f")) {
                                Label("the Magic Numbers™:", systemImage: "barcode")
                            }
                            .onSubmit {
                                tryActivatingLicense()
                            }
                            .multilineTextAlignment(.center)
                            .frame(width: 470)
                            .fixedSize()
                        }
                    }
                    .foregroundColor(isActivated ? .gray : .primary)
                    .disabled(isActivated)

                    HStack {
                        if isActivated {
                            Button(removeLicenseButtoNText) {
                                tryRemovingLicense()
                            }
                            .disabled(removeLicenseButtoNText == "removing...")
                                                       
                            Spacer()
                            
                            Button("manage subscription") {
                            }
                        } else {
                            Spacer()
                            Button(activateSubscriptionButtonText) {
                                tryActivatingLicense()
                            }
                                                        
                            .disabled(awesomeHumanEmail.isEmpty || magicNumbers.isEmpty || activateSubscriptionButtonText == "activating...")
                            .alert("☕️☕️☕️", isPresented: $isActivated, presenting: awesomeHumanEmail) { detail in
                                Button("OK") {}
                            } message: { detail in
                                Text("hmmm")
                            }
                        }
                    }
                }
                .padding(.top, 12)
            }
        }
        .frame(width: 570, height: nil)
        .padding(10)
    }
    
    private func tryActivatingLicense() {
        guard awesomeHumanEmail.isEmpty == false, magicNumbers.isEmpty == false else { return }
        
        activateSubscriptionButtonText = "activating..."
        
        AppCore.shared.licensing.paddleProduct?.activateEmail(awesomeHumanEmail, license: magicNumbers) { success, _ in
            if success {
                isActivated = true
            }
            
            activateSubscriptionButtonText = "activate subscription"
        }
    }
        
    private func tryRemovingLicense() {
        removeLicenseButtoNText = "removing..."
                
        AppCore.shared.licensing.paddleProduct?.deactivate() { success, _ in
            awesomeHumanEmail = ""
            magicNumbers = ""
            isActivated = false
            removeLicenseButtoNText = "remove license"
        }
    }
    
}


struct LicensePane_Previews: PreviewProvider {
    
    static var previews: some View {
        LicensePane()
    }
        
}
