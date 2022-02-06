import SwiftUI


struct ExpiredLicensePopoverView: View {
    
    @Environment(\.openURL) var openURL    
    
    
    var body: some View {
        
        Form {
            VStack {
                Text("😬️😬️😬️ license expired 😬️😬️😬️")
                    .font(.headline)
                    .padding(.bottom, 9)
                
                Divider()
                
                HStack {
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("seems you're license is expired.")
                        Text("if that's right, you can always get a new one.")
                        Text("if that's wrong, huh, please contact us.")
                        HStack {
                            Button("i wanna abuse more") {
                                openURL(URL(string: "https://subscribe.kindavim.app")!)
                            }
                            Button("i wanna contact you") {
                                openURL(URL(string: "mailto:guill@sleeplessmind.com.mo?subject=your%20shit%20app%20says%20license%20is%20expired")!)
                            }
                        }
                        Text("or press any Vim motion that goes back to Insert Mode.")
                            .foregroundColor(.gray)
                            .font(.footnote)
                            .padding(.top, 1)
                    }
                    .font(.callout)
                }
            }
            
        }
        .fixedSize(horizontal: true, vertical: false)
        .padding() 
    }
    
}


struct ExpiredLicensePopoverView_Previews: PreviewProvider {
    
    static var previews: some View {
        ExpiredLicensePopoverView()
    }
       
}
