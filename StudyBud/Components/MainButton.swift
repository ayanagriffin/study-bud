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

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.buttonText)
                .mainButtonStyle()
        }
    }
}
