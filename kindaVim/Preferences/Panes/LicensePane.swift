import SwiftUI


struct LicensePane: View {

    var body: some View {
        
        Form {
            
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
            
            HStack(alignment: .top) {
                Spacer()
                Label("the awesome human: ", systemImage: "figure.walk")
                Text(verbatim: "hair@craigfederighi.com")
                Spacer()
                Button("Manage your Subscription") {}
            }
            .padding(.top, 12)
            .foregroundColor(.gray)
            .disabled(true)
            
        }
        .frame(width: 570, height: nil)
        .padding(10)
    }
    
}


struct LicensePane_Previews: PreviewProvider {
    
    static var previews: some View {
        LicensePane()
    }
        
}
