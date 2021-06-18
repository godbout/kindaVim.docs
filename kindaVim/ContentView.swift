import SwiftUI

struct TextView: NSViewRepresentable {

    @Binding var text: String
    typealias NSViewType = NSTextView

    func makeNSView(context: Context) -> NSTextView {
        let nsTextView = NSTextView()
        
        nsTextView.font = NSFont.userFixedPitchFont(ofSize: 16)
        nsTextView.isAutomaticQuoteSubstitutionEnabled = false
        
        return nsTextView
    }

    func updateNSView(_ nsView: NSTextView, context: Context) {
        nsView.string = text
    }

}

struct ContentView: View {

    @State var textFieldValue = ""
    @State var textViewValue = ""

    var body: some View {
        VStack {
            TextField("single line text field for test", text: $textFieldValue)                
                
            if #available(macOS 11.0, *) {
                TextEditor(text: $textViewValue)
            } else {
                TextView(text: $textViewValue)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 200, maxHeight: .infinity)
            }

            Button("wo'hevah", action: {})
        }
        .font(.system(size: 16, weight: .regular, design: .monospaced))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
