import SwiftUI


struct CharactersView: View {

    var lettersTyped: String

    var body: some View {
        
        HStack {
            Text(lettersTyped)
                .font(.largeTitle)
                .foregroundColor(.black)
                .kerning(4)
        }
        .frame(width: 269, height: 60, alignment: .center)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
    
}

struct CharactersView_Previews: PreviewProvider {

    static var previews: some View {
        CharactersView(lettersTyped: "$$Ojjk")
    }
    
}
