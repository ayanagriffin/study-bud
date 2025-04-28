import SwiftUI

struct LandingView: View {
    var body: some View {
        ZStack {
            Image("Kitchen")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer()
                
                Image("Percy_Idle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)

                Spacer()
                
                InfoBubble {
                    Text("Let's get to work!")
                        .font(.mainHeader)
                        .foregroundColor(.black)
                    
                    MainButton(title: "Next") {
                        print("Next tapped")
                    }
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LandingView()
}
