import SwiftUI

struct TaskSelectionView: View {
    let options: [String]
    @Binding var customTask: String
    let onSelect: (String) -> Void

    var body: some View {
        VStack(spacing: 16) {
            ForEach(options, id: \.self) { opt in
                Button(opt) {
                    onSelect(opt)
                }
                .buttonStyle(SecondaryButtonStyle())
            }

            HStack {
                TextField("Other…", text: $customTask)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button("Set") {
                    let trimmed = customTask.trimmingCharacters(in: .whitespaces)
                    guard !trimmed.isEmpty else { return }
                    onSelect(trimmed)
                }
                .buttonStyle(PrimaryButtonStyle())
            }
        }
    }
}

