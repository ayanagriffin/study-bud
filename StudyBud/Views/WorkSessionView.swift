// Views/WorkSessionView.swift

import SwiftUI

struct WorkSessionView: View {
    @StateObject var vm: WorkSessionViewModel
    @Environment(\.dismiss) private var dismiss

    @State private var isCompact = false
    @State private var showExitConfirm = false
    @State private var showPausedDialog = false

    var body: some View {
        ZStack {
            VStack {
                headerView
                Spacer()
                Image("CharacterAssetName")
                  .resizable()
                  .scaledToFit()
                  .frame(maxHeight: 300)
                  .padding(.horizontal)
                Spacer()
                HStack(spacing: 40) {
                    CircleButton(iconName: "xmark", label: "Exit") {
                        showExitConfirm = true
                    }
                    CircleButton(
                        iconName: vm.isPaused ? "play.fill" : "pause.fill",
                        label: vm.isPaused ? "Resume" : "Pause"
                    ) {
                        vm.pause()
                        showPausedDialog = true
                    }
                }
                .padding(.bottom, 30)
            }
            .animation(.default, value: isCompact)

            // Exit confirmation
            DialogView(
                isPresented: $showExitConfirm,
                message: "Are you sure you want to exit?",
                characterImageName: "CharacterAssetName"
            ) {
                HStack(spacing: 24) {
                    Button("Yes") {
                        vm.exit()
                        dismiss()
                    }
                    .font(.headline)

                    Button("No") {
                        showExitConfirm = false
                    }
                    .buttonStyle(PrimaryButtonStyle())
                }
            }

            // Pause confirmation
            DialogView(
                isPresented: $showPausedDialog,
                title: "Paused",
                message: "Ok, but don’t take too long! Come back soon!",
                characterImageName: "CharacterAssetName"
            ) {
                Button("Resume") {
                    vm.resume()
                    showPausedDialog = false
                }
                .buttonStyle(PrimaryButtonStyle())
            }
        }
    }

    @ViewBuilder
    private var headerView: some View {
        if isCompact {
            HStack {
                Spacer()
                Text(vm.formattedTime)
                   .font(.headline)
                   .padding(.vertical, 6)
                   .padding(.horizontal, 12)
                   .background(.ultraThinMaterial)
                   .cornerRadius(10)

                Button {
                    isCompact = false
                } label: {
                    Image(systemName: "arrow.up.left.and.arrow.down.right")
                        .font(.title3)
                        .padding(.trailing, 12)
                }
            }
            .padding(.top)
        } else {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 4) {
                    Text("Task: \(vm.taskName)")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    Text(vm.formattedTime)
                        .font(.title).bold()

                    Text("\(vm.percentComplete)% Complete")
                        .font(.caption)
                        .foregroundColor(.secondary)

                    ProgressView(value: vm.progress)
                        .scaleEffect(x: 1, y: 4, anchor: .center)
                        .clipShape(Capsule())
                }
                Spacer()
                Button {
                    isCompact = true
                } label: {
                    Image(systemName: "arrow.down.right.and.arrow.up.left")
                        .font(.title3)
                }
                .padding(.top, 4)
                .padding(.trailing, 12)
            }
            .padding()
            .background(.ultraThinMaterial)
            .cornerRadius(12)
            .padding(.horizontal)
        }
    }
}
