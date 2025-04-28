//
//  MainButton.swift
//  StudyBud
//
//  Created by Ayana Griffin on 4/28/25.
//

import SwiftUI

struct MainButton: View {
    var title: String
    var action: () -> Void

    @State private var isPressed = false

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 20, weight: .bold))
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, minHeight: 50)
                .background(isPressed ? Color.buttonSecodary : Color.buttonPrimary)
                .cornerRadius(CornerRadius.button)
                .padding(.horizontal, 20)
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(DragGesture(minimumDistance: 0)
            .onChanged { _ in isPressed = true }
            .onEnded { _ in isPressed = false }
        )
    }
}
