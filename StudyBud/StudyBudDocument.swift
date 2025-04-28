import SwiftUI
import UniformTypeIdentifiers

class StudyBudDocument: ReferenceFileDocument, ObservableObject {
    static var readableContentTypes: [UTType] { [.plainText] }

    @Published var text: String = "Welcome to StudyBud!"

    required init() { }

    required init(configuration: ReadConfiguration) throws {
        if let data = configuration.file.regularFileContents,
           let content = String(data: data, encoding: .utf8) {
            text = content
        } else {
            throw CocoaError(.fileReadCorruptFile)
        }
    }

    func snapshot(contentType: UTType) throws -> StudyBudDocument {
        return self
    }

    func fileWrapper(snapshot: StudyBudDocument, configuration: WriteConfiguration) throws -> FileWrapper {
        let data = snapshot.text.data(using: .utf8)!
        return .init(regularFileWithContents: data)
    }
}
