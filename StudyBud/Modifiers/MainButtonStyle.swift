//
//  MainButtonStyle.swift
//  StudyBud
//
//  Created by Ayana Griffin on 4/28/25.
//

import SwiftUI

struct MainButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.buttonPrimary)
            .foregroundColor(.black)
            .cornerRadius(CornerRadius.button)
    }
}

extension View {
    func mainButtonStyle() -> some View {
        self.modifier(MainButtonStyle())
    }
}
