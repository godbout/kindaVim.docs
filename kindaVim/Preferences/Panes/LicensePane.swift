import SwiftUI


struct LicensePane: View {
    
    @State private var awesomeHumanEmail = ""
    @State private var magicNumbers = ""

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
                    HStack {
                        Spacer()
                        TextField(text: $awesomeHumanEmail, prompt: Text("guill@sleeplessmind.com.mo")) {
                            Label("the Awesome Human's email:", systemImage: "figure.walk")
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
                        .multilineTextAlignment(.center)
                        .frame(width: 470)
                        .fixedSize()
                    }
                    Button("activate subscription") {
                        print("trying to activate")
                    }
                }
                .padding(.top, 12)
                .foregroundColor(.gray)
                .disabled(true)
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
