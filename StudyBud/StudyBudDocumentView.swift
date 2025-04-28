import SwiftUI

struct StudyBudDocumentView: View {
    @Binding var document: StudyBudDocument

    var body: some View {
        VStack {
            TextEditor(text: $document.text)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .padding()

            Text("Characters: \(document.text.count)")
                .font(.footnote)
                .foregroundColor(.gray)
                .padding()
        }
    }
}
