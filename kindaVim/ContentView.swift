import SwiftUI

struct TextView: NSViewRepresentable {

    @Binding var text: String
    typealias NSViewType = NSTextView

    func makeNSView(context: Context) -> NSTextView {
        NSTextView()
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
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 100, maxHeight: .infinity)
            }

            Button("wo'hevah", action: {})
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
