import SwiftUI


struct LicensePane: View {

    var body: some View {
        
        Form {
            
            HStack {
                Spacer()
                VStack(alignment: .leading) {
                    Text("One of These Days™ kV will be sleeping from 5am to 1pm (Winter schedule) every day. at this time you may get a subscription if you wish to torture kV 24 hours a day.")
                        .padding(.bottom)
                    Text("currently kV is still young and can handle the pressure. so please abuse it for free.")
                }
                    .fixedSize(horizontal: false, vertical: true)
                    .padding(.bottom)
                Spacer()
            }
            
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
