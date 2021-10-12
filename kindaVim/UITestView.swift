import SwiftUI

struct TextView: NSViewRepresentable {

    @Binding var text: String
    typealias NSViewType = NSTextView

    func makeNSView(context: Context) -> NSTextView {
        let nsTextView = NSTextView()
        
        nsTextView.font = NSFont.userFixedPitchFont(ofSize: 16)
        nsTextView.isAutomaticQuoteSubstitutionEnabled = false
        nsTextView.isAutomaticSpellingCorrectionEnabled = false
        nsTextView.isAutomaticDataDetectionEnabled = false
        nsTextView.isAutomaticLinkDetectionEnabled = false
        nsTextView.isAutomaticTextCompletionEnabled = false
        nsTextView.isAutomaticDashSubstitutionEnabled = false
        nsTextView.isAutomaticTextReplacementEnabled = false
        
        return nsTextView
    }

    func updateNSView(_ nsView: NSTextView, context: Context) {
        nsView.string = text
    }

}

struct UITestView: View {

    @State var textFieldValue = ""
    @State var textViewValue = ""

    var body: some View {
        VStack {
            TextField("single line text field for test", text: $textFieldValue)                
            TextEditor(text: $textViewValue)
            Button("wo'hevah", action: {})
        }
        .font(.system(size: 16, weight: .regular, design: .monospaced))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding()
    }

}


struct UITestView_Previews: PreviewProvider {
    static var previews: some View {
        UITestView()
    }
}
