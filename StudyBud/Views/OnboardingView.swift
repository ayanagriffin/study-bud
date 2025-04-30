import SwiftUI

struct OnboardingView: View {
    @State private var navigate = false
    
    var body: some View {
        ZStack {
            GeometryReader { geo in
                VStack() {
                    Text("Welcome! Choose your productivity friend.")
                        .font(.mainHeader)
                        .foregroundColor(.black)
                        .multilineTextAlignment(.center)
                    
                    VStack(spacing:-15){
                        CharacterCard(
                            imageName: "percyIdle",
                            name: "Positive Percy",
                            description: "Stays positive even in the hardest times",
                            onTap: { print("Percy tapped!") },
                            characterSide: "left"
                        )
                        
                        CharacterCard(
                            imageName: "sassy-mary",
                            name: "Sassy Mary",
                            description: "Gets a little feisty and will put you to work",
                            onTap: { print("Mary tapped!") },
                            characterSide: "right"
                        )

                        CharacterCard(
                            imageName: "gentle-joey",
                            name: "Gentle Joey",
                            description: "Understanding and very forgiving at all times",
                            onTap: { print("Joey tapped!") },
                            characterSide: "left"
                        )
                    }
                    

                    MainButton(title: "Next") {
                        print("Next tapped")
                    }
                }
                .padding(.horizontal)
                .frame(width: geo.size.width)
                .frame(height: geo.size.height, alignment: .center)
                .position(x: geo.size.width / 2, y: geo.size.height / 2)
            }
        }
    }
}


#Preview {
    OnboardingView()
}
