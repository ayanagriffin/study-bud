// Views/PreSessionView.swift

import SwiftUI

struct PreSessionView: View {
    @StateObject private var vm = PreSessionViewModel()

    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                // MARK: – Header & Prompt
                HeaderView(title: "Session Setup")
                SpeechBubble(text: vm.promptText)

                Spacer()

                // MARK: – Step Content
                switch vm.step {
                case .chooseTask:
                    TaskSelectionView(
                        options: vm.taskOptions,
                        customTask: $vm.taskName,
                        onSelect: vm.selectTask
                    )

                case .chooseDuration:
                    DurationSelectionView(onSelect: vm.selectDuration)

                case .confirm:
                    if vm.isLoadingRecap {
                        ProgressView("Generating…")
                            .frame(maxWidth: .infinity)
                    } else {
                        Button("Start \(vm.duration!)-Min Session") {
                            vm.confirmAndStart()
                        }
                        .buttonStyle(PrimaryButtonStyle())
                    }
                }

                Spacer()

                // MARK: – Back Arrow
                BackArrow {
                    switch vm.step {
                    case .chooseTask:
                        break
                    case .chooseDuration:
                        vm.step = .chooseTask
                    case .confirm:
                        vm.step = .chooseDuration
                    }
                }
            }
            .padding()
            // MARK: – Navigate when the session starts
            .navigationDestination(isPresented: $vm.isSessionActive) {
                // workVM is non‑nil because isSessionActive only flips after confirmAndStart()
                WorkSessionView(vm: vm.workVM!)
            }
        }
    }
}

struct PreSessionView_Previews: PreviewProvider {
    static var previews: some View {
        PreSessionView()
    }
}
