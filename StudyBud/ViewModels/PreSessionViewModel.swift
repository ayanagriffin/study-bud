import Combine
import SwiftUI

enum PreSessionStep {
    case chooseTask, chooseDuration, confirm
}

class PreSessionViewModel: ObservableObject {
    @Published var step: PreSessionStep = .chooseTask
    @Published var taskName: String = ""
    @Published var duration: Int?
    @Published var recapText: String?
    @Published var isLoadingRecap = false
    @Published var isSessionActive = false


    private let store = SessionStore()
    private var cancellables = Set<AnyCancellable>()
    
    var workVM: WorkSessionViewModel?


    init() {
        // preload last session if any
        if let last = store.loadLast() {
            taskName = last.taskName
            duration = last.durationMinutes
        }
    }

    var taskOptions: [String] {
        // 1) Grab & de‑dupe recents
        let recents = store
            .recentTasks
            .filter { !$0.isEmpty }
            .reduce(into: [String]()) { acc, task in
                if !acc.contains(task) {
                    acc.append(task)
                }
            }

        switch recents.count {
        case let n where n >= 2:
            // two most recent
            return Array(recents.prefix(2))

        case 1:
            // one recent → pick the other preset so we don’t duplicate
            let first = recents[0]
            let fallback = (first == "Homework" ? "Chores" : "Homework")
            return [first, fallback]

        default:
            // no recents
            return ["Homework", "Chores"]
        }
    }


    func selectTask(_ name: String) {
        taskName = name
        step = .chooseDuration
    }

    func selectDuration(_ minutes: Int) {
        duration = minutes
        step = .confirm
        generateRecap()
    }

    private func generateRecap() {
//        guard let dur = duration else { return }
//        isLoadingRecap = true
//        AIClient.shared
//            .generateRecap(task: taskName, duration: dur)
//            .receive(on: DispatchQueue.main)
//            .sink { _ in }
//            receiveValue: { [weak self] text in
//                guard let self = self else { return }
//                self.recapText = text
//                self.isLoadingRecap = false
//            }
//            .store(in: &cancellables)
    }

    func confirmAndStart() {
            guard let dur = duration else { return }
            let settings = SessionSettings(taskName: taskName,
                                           durationMinutes: dur)
            store.save(settings: settings)

            // 1) Create the work session VM
            let sessionVM = WorkSessionViewModel(taskName: taskName,
                                                 durationMinutes: dur)
            self.workVM = sessionVM

            // 2) Trigger SwiftUI navigation
            isSessionActive = true
        }

    var promptText: String {
        switch step {
        case .chooseTask:     return DialogueManager.randomTaskPrompt()
        case .chooseDuration: return DialogueManager.randomDurationPrompt()
        case .confirm:        return recapText ?? "Ready to rock?"
        }
    }
}

