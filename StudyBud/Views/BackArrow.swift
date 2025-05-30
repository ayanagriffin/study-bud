import SwiftUI

struct BackArrow: View {
    let action: () -> Void

    var body: some View {
        HStack {
            Button(action: action) {
                Image(systemName: "chevron.left")
                    .font(.title2)
            }
            Spacer()
        }
        .padding(.horizontal)
    }
}

