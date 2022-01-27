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
//        
    let response: [Response]
    
}


struct LicensePane: View {
    
    @State private var awesomeHumanEmail = AppCore.shared.licensing.paddleProduct?.activationEmail ?? ""
    @State private var magicNumbers = AppCore.shared.licensing.paddleProduct?.licenseCode ?? ""
    @State private var isActivated = AppCore.shared.licensing.isActivated
    @State private var activateSubscriptionButtonText = "activate subscription" 
    @State private var removeLicenseButtonText = "remove license" 
    @State private var recoverOrdersButtonText = "recover orders"
    @State private var manageSubscriptionButtonText = "manage subscription"
    @State private var orderNumber = ""
    
    var body: some View {
        
        Form {
            VStack {
                HStack(alignment: .top) {
                    VStack {
                        Image(systemName: "checkmark.seal")
                            .font(.system(size: 64))
                            .foregroundColor(isActivated ? .primary : .gray)
                            .opacity(isActivated ? 1 : 0.1)
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
                .padding(.vertical, 12)
                .foregroundColor(isActivated ? .gray : .primary)
                .disabled(isActivated)
                
                Divider()
                
                HStack {
                    Spacer()
                    VStack(alignment: .trailing) {
                        if isActivated {
                            HStack(alignment: .top) {
                                Spacer() 
                                TextField(text: $orderNumber, prompt: Text("12345678-87654321")) {
                                    Label("your Order / Receipt #:", systemImage: "doc.text")
                                }
                                .onSubmit {
                                    trySendingAwesomeHumanToSubscriptionManagementPage()
                                }
                                .multilineTextAlignment(.center)
                                .frame(width: 315)
                                Button(action: { trySendingAwesomeHumanToSubscriptionManagementPage() }) {
                                    Text(manageSubscriptionButtonText)
                                        .frame(width: 128)
                                }                                
                                .disabled(orderNumber.isEmpty || manageSubscriptionButtonText == "generating link...")
                            }
                        } else {
                            Button(action: { tryActivatingLicense() }) {
                                Text(activateSubscriptionButtonText)
                                    .frame(width: 128)
                            }
                            .disabled(awesomeHumanEmail.isEmpty || magicNumbers.isEmpty || activateSubscriptionButtonText == "activating...")
                        }
                                           
                        HStack(alignment: .bottom) {
                            Text("click to receive an email with your Orders Information if you've lost them.")
                                .fixedSize()
                                .font(.footnote)
                                .foregroundColor(.gray)
                            Button(action: { tryRecoveringOrders() }) {
                                Text(recoverOrdersButtonText)
                            }
                            .disabled(awesomeHumanEmail.isEmpty || recoverOrdersButtonText == "sending email...")
                        }
                    }
                    .padding(.top, 12)
                }
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
    
    private func trySendingAwesomeHumanToSubscriptionManagementPage() {
        guard orderNumber.isEmpty == false else { return }
        
        manageSubscriptionButtonText = "generating link..."
        
        Task  {
            let headers = ["Content-Type": "application/json"]
            
            let auth: [String: Any] = [
                "vendor_id": 138003,
                "vendor_auth_code": "955e72991b8885fb930489d5bec94bc96b83d31cf2181585b8"
            ]

            let urlString = "https://vendors.paddle.com/api/2.0/order/" + orderNumber + "/transactions"
            print(urlString)
            let url = URL(string: "https://vendors.paddle.com/api/2.0/order/" + orderNumber + "/transactions")
            var request = URLRequest(url: url!)
            request.httpMethod = "POST"
            request.allHTTPHeaderFields = headers
            request.httpBody = try! JSONSerialization.data(withJSONObject: auth, options: [])
            
            let (data, _) = try! await URLSession.shared.data(for: request)
            let json = try! JSONDecoder().decode(PaddleAPI.self, from: data)
            
            print(json.response.first?.subscription.subscription_id)
            
            manageSubscriptionButtonText = "manage subscription"
            orderNumber = ""
        }
    }
    
}


struct LicensePane_Previews: PreviewProvider {
    
    static var previews: some View {
        LicensePane()
    }
        
}
