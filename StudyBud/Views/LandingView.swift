import SwiftUI

struct LandingView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome to StudyBud!")
                    .font(.largeTitle)
                    .fontWeight(.bold)

            }
            .padding()
            .navigationTitle("StudyBud")
        }
    }
}

#Preview {
    LandingView()
}
