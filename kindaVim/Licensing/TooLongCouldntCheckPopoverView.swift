import SwiftUI


struct TooLongCouldntCheckPopoverView: View {
    
    @Environment(\.openURL) var openURL    
    
    
    var body: some View {
        
        Form {
            VStack {
                Text("🌍️🌍️🌍️ can't check license for so long 🌍️🌍️🌍️")
                    .font(.headline)
                    .padding(.bottom, 9)
                
                Divider()
                
                HStack {
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("we couldn't check the license status for at least 15 days.")
                        Text("i know that sucks but we have to do that from time to time.")
                        Text("just connect to the Internet and you'll be fine.")
                        Text("if you think that's a mistake please contact us.")                                               
                        Button("hey that's a mistake!") {
                            openURL(URL(string: "mailto:guill@sleeplessmind.com.mo?subject=your%20shit%20app%20says%20it%20can't%20check%20the%20license%20status")!)
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


struct TooLongCouldntCheckPopoverView_Previews: PreviewProvider {
    
    static var previews: some View {
        TooLongCouldntCheckPopoverView()
    }
       
}
