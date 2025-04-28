import SwiftUI

struct StudyBudView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Welcome to StudyBud!")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                Text("Start a session to begin your focus journey.")
                    .font(.subheadline)
                    .foregroundColor(.gray)

                NavigationLink(destination: Text("Session Screen Coming Soon")) {
                    Text("Start New Session")
                        .fontWeight(.semibold)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.teal)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                        .padding(.horizontal)
                }
            }
            .padding()
            .navigationTitle("StudyBud")
        }
    }
}

#Preview {
    StudyBudView()
}
