//
//  LandingView 2.swift
//  StudyBud
//
//  Created by Ayana Griffin on 5/30/25.
//


import SwiftUI

struct LandingView: View {
    @State private var navigate = false

    var body: some View {
        NavigationStack {
            ZStack {
                Image("kitchen")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()

                VStack(spacing: 20) {
                    Spacer()

                    Image("percyIdle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 350, height: 350)

                    Spacer()

                    Text("Let's get to work!")
                        .font(.mainHeader)
                        .foregroundColor(.black)

                    MainButton(title: "Next") {
                        navigate = true
                        print("Next tapped")
                    }

                    Spacer()
                }
            }
            .navigationDestination(isPresented: $navigate) {
                PreSessionView()
            }
        }
    }
}

#Preview {
    LandingView()
}

