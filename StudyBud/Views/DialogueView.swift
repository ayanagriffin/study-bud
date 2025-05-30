// Views/DialogView.swift

import SwiftUI

struct DialogView<Buttons: View>: View {
    // If true, show the overlay + dialog
    @Binding var isPresented: Bool

    // Optional title
    let title: String?
    // The speech‑bubble text
    let message: String
    // Name of your character asset
    let characterImageName: String
    // Buttons (e.g. Yes/No, Resume, etc.)
    let buttons: Buttons

    init(
        isPresented: Binding<Bool>,
        title: String? = nil,
        message: String,
        characterImageName: String,
        @ViewBuilder buttons: () -> Buttons
    ) {
        self._isPresented = isPresented
        self.title = title
        self.message = message
        self.characterImageName = characterImageName
        self.buttons = buttons()
    }

    var body: some View {
        if isPresented {
            Color.black.opacity(0.4)
                .ignoresSafeArea()

            VStack {
                ZStack(alignment: .topTrailing) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .frame(width: 300)

                    // Close “×”
                    Button { isPresented = false } label: {
                        Image(systemName: "xmark")
                            .padding(12)
                    }

                    VStack(spacing: 16) {
                        // Title, if any
                        if let title = title {
                            Text(title)
                                .font(.title2).bold()
                        }

                        // Speech bubble + character
                        HStack(alignment: .top, spacing: 12) {
                            SpeechBubble(text: message)
                            Image(characterImageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                        }

                        // Your custom buttons
                        buttons
                    }
                    .padding(.top, 40)
                    .padding(.horizontal, 24)
                    .padding(.bottom, 20)
                }
            }
        }
    }
}

