import SwiftUI


struct BedtimePopoverView: View {
    
    @Environment(\.openURL) var openURL    
    var sentence: String
    
    
    var body: some View {
        
        Form {
            VStack {
                Text(sentence)
                    .font(.headline)
                    .padding(.bottom, 9)
                
                Divider()
                
                HStack {
                    Spacer()
                    VStack(alignment: .trailing) {
                        Text("kV is sleeping from 5am to 1pm every day.")
                        Text("wanna torture it 24/7? checkout the sub!")
                        Button("yes, i wanna abuse kV so bad") {
                            openURL(URL(string: "https://kindavim.app")!)
                        }
                        Button("no, let kV sleep till 1pm today") {
                            
                        }
                    }
                    .font(.callout)
                }
            }
            
        }
        .fixedSize(horizontal: true, vertical: false)
        .padding() 
    }
    
}


struct BedtimePopoverView_Previews: PreviewProvider {
    
    static var previews: some View {
        BedtimePopoverView(sentence: "hehe")
    }
       
}
