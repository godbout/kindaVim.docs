import SwiftUI

struct ContentView: View {
    @State var textFieldValue = ""

    var body: some View {
        VStack {
            TextField("single line text field for test", text: $textFieldValue)
                .padding()
            Button("wo'hevah", action: {})
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
