import SwiftUI


struct CharactersView: View {

    var ongoingMove: String

    var body: some View {
        
        HStack {
            Text(ongoingMove)
                .font(.largeTitle)
                .foregroundColor(.black)
                .kerning(4)
        }
        .frame(width: CGFloat(40 + (ongoingMove.count * 20)), height: 60, alignment: .center)
        .padding()
        .background(Color.white)
        .cornerRadius(10)
    }
    
}

struct CharactersView_Previews: PreviewProvider {

    static var previews: some View {
        CharactersView(ongoingMove: "$$Ojjk")
    }
    
}
