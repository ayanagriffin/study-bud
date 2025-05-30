import SwiftUI

struct HeaderView: View {
    let title: String

    var body: some View {
        HStack {
            Text(title)
                .font(.largeTitle).bold()
            Spacer()
        }
    }
}

