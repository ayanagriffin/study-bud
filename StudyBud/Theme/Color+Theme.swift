import SwiftUI

extension Color {
    static let userSpeechBubble = Color(hex: "#CFFFF7")
    static let white = Color(hex: "#FFFFFF")
    static let buttonPrimary = Color(hex: "#C6D8D6")
    static let buttonSecodary = Color(hex: "#87ADA9")
    static let black = Color(hex: "#000000")

    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        
        let r = Double((rgb >> 16) & 0xFF) / 255
        let g = Double((rgb >> 8) & 0xFF) / 255
        let b = Double(rgb & 0xFF) / 255
        
        self.init(red: r, green: g, blue: b)
    }
}
