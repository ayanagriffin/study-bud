import SwiftUI

struct LandingView: View {
    var body: some View {
        ZStack {
            // Background
            Image("Kitchen")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer()
                
                // Buddy Character
                Image("Percy_Idle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)

                Spacer()
                
                // Speech bubble card
                VStack(spacing: 15) {
                    Text("Let's get to work!")
                        .font(.system(size: 25, weight: .bold))
                        .foregroundColor(.black)
                    
                    MainButton(title: "Next") {
                        print("Next tapped")
                    }
                }
                .padding()
                .background(Color.white)
                .cornerRadius(20)
                .shadow(radius: 10)
                .padding(.horizontal, 30)
                
                Spacer()
            }
        }
    }
}

#Preview {
    LandingView()
}
