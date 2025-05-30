import Foundation
import Combine

// Drives the work‑session timer, pause/resume, progress, and exit.
class WorkSessionViewModel: ObservableObject {
    // Input
    let taskName: String
    private let totalSeconds: TimeInterval

    // Published state
    @Published private(set) var secondsRemaining: TimeInterval
    @Published var isPaused = false

    // Timer
    private var timerCancellable: AnyCancellable?

    init(taskName: String, durationMinutes: Int) {
        self.taskName = taskName
        self.totalSeconds = TimeInterval(durationMinutes * 60)
        self.secondsRemaining = totalSeconds
        startTimer()
    }

    private func startTimer() {
        timerCancellable = Timer
            .publish(every: 1, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self = self, !self.isPaused else { return }
                if self.secondsRemaining > 0 {
                    self.secondsRemaining -= 1
                } else {
                    self.timerCancellable?.cancel()
                }
            }
    }

    func pause() {
        isPaused = true
    }

    func resume() {
        if isPaused && secondsRemaining > 0 {
            isPaused = false
        }
    }

    func exit() {
        timerCancellable?.cancel()
        // you can send a delegate/callback here to actually dismiss the view
    }

    // MARK: - Helpers for the View

    // “MM:SS”
    var formattedTime: String {
        let mins = Int(secondsRemaining) / 60
        let secs = Int(secondsRemaining) % 60
        return String(format: "%02d:%02d", mins, secs)
    }

    // 0.0 … 1.0
    var progress: Double {
        return 1.0 - (secondsRemaining / totalSeconds)
    }

    // 0 … 100
    var percentComplete: Int {
        Int(progress * 100)
    }
}
