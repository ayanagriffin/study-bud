//
//  InfoBubble.swift
//  StudyBud
//
//  Created by Ayana Griffin on 4/28/25.
//
import SwiftUI

struct InfoBubble<Content: View>: View {
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        VStack(spacing: 15) {
            content
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 10)
        .padding(.horizontal, 30)
    }
}
