import SwiftUI

// A circular button with an SF icon and a label below it.
struct CircleButton: View {
    let iconName: String
    let label: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            VStack(spacing: 6) {
                Image(systemName: iconName)
                    .font(.title2)
                Text(label)
                    .font(.caption)
            }
            .padding()
            .frame(width: 80, height: 80)
            .overlay(
                Circle()
                    .stroke(lineWidth: 2)
            )
        }
    }
}
