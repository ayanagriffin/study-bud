import SwiftUI

struct DurationSelectionView: View {
    let onSelect: (Int) -> Void

    var body: some View {
        HStack(spacing: 16) {
            Button("30 Minutes") { onSelect(30) }
                .buttonStyle(PrimaryButtonStyle())
            Button("45 Minutes") { onSelect(45) }
                .buttonStyle(PrimaryButtonStyle())
        }
    }
}

