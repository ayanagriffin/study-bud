import SwiftUI

struct SpeechBubble: View {
    let text: String

    var body: some View {
        Text(text)
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .stroke(lineWidth: 2)
            )
            .padding(.horizontal)
    }
}

