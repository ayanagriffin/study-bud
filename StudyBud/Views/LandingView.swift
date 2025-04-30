import SwiftUI

struct LandingView: View {
    @State private var navigate = false
    
    var body: some View {
        ZStack {
            Image("kitchen")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()

            VStack(spacing: 20) {
                Spacer()
                
                Image("percyIdle")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 350, height: 350)

                Spacer()
                
                Text("Let's get to work!")
                    .font(.mainHeader)
                    .foregroundColor(.black)
                
                NavigationLink(destination: OnboardingView(), isActive: $navigate){
                    EmptyView()
                }

                
                MainButton(title: "Next") {
                    navigate = true
                    print("Next tapped")
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    LandingView()
}
