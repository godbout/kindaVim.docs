import SwiftUI


struct PaddleTestingPane: View {

    var body: some View {
        
        Form {
            VStack {
                Button("refresh") {
                    AppCore.shared.licensing.paddleProduct?.refresh({ (delta: [AnyHashable : Any]?, error: Error?) in
                        print(delta)
                    })
                }
                Button("activate license") {
                    AppCore.shared.licensing.paddleProduct?.activateEmail("guill.bout@gmail.com",
                                                 license: "PD-f8cabe2a-9bfd-4556-a3ac-d991666c2c8f",
                                                 completion: {
                        (activated: Bool, error: Error?) in
                        let alert: NSAlert = NSAlert()
                        alert.messageText = String(activated)
                        alert.addButton(withTitle: "OK")
                        _ = alert.runModal()
                    })
                }
                
                Button("check license status") {
                    let activated = AppCore.shared.licensing.paddleProduct?.activated ?? false
                    
                    let alert: NSAlert = NSAlert()
                    alert.messageText = String(activated)
                    alert.addButton(withTitle: "OK")
                    _ = alert.runModal()
                }
                
                Button("recover license") {
                    AppCore.shared.licensing.paddle?.recoverLicense(for: AppCore.shared.licensing.paddleProduct!, email: "guill.bout@gmail.com", completion: nil)
                }
                
                Button("show license recovery") {
                    AppCore.shared.licensing.paddle?.showLicenseRecovery(for: AppCore.shared.licensing.paddleProduct!, completion: nil)
                }
                
                Button("deactivate") {
                    AppCore.shared.licensing.paddleProduct?.deactivate(completion: {(success, error) in
                        let alert: NSAlert = NSAlert()
                        alert.messageText = String(success)
                        alert.addButton(withTitle: "OK")
                        _ = alert.runModal()
                    })
                }
                
                Button("subscription info") {
                    let date = AppCore.shared.licensing.paddleProduct?.activationDate
                    let email = AppCore.shared.licensing.paddleProduct?.activationEmail
                    let activationID = AppCore.shared.licensing.paddleProduct?.activationID
                    let lastRefreshDate = AppCore.shared.licensing.paddleProduct?.lastRefreshDate
                    let lastVerification = AppCore.shared.licensing.paddleProduct?.lastVerifyDate
                    let lastSuccessfulVerification = AppCore.shared.licensing.paddleProduct?.lastSuccessfulVerifiedDate
                    let licenseCode = AppCore.shared.licensing.paddleProduct?.licenseCode
                    let licenseExpiryDate = AppCore.shared.licensing.paddleProduct?.licenseExpiryDate
                    
                    let alert: NSAlert = NSAlert()
                    alert.messageText = """
    date: \(String(describing: date))
    email: \(String(describing: email))
    activationID: \(String(describing: activationID))
    lastRefreshDate" \(String(describing: lastRefreshDate))
    lastVerification: \(String(describing: lastVerification))
    lastSuccessfulVerification: \(String(describing: lastSuccessfulVerification))
    licenseCode: \(String(describing: licenseCode))
    licenseExpiryDate: \(String(describing: licenseExpiryDate))
    """
                    alert.addButton(withTitle: "OK")
                    _ = alert.runModal()
                }
            }
        }
        .frame(width: 570, height: nil)
        .padding(10)
    }
    
}


struct PaddleTestingPane_Previews: PreviewProvider {
    
    static var previews: some View {
        PaddleTestingPane()
    }
}
