import SwiftUI

struct ContentView: View {
    @Environment(ProgressManager.self) private var progress
    @State private var path = NavigationPath()

    var body: some View {
        Group {
            if !progress.hasOnboarded {
                OnboardingView()
            } else {
                NavigationStack(path: $path) {
                    HomeView(path: $path)
                        .navigationDestination(for: WeekRoute.self) { route in
                            WeekView(weekIndex: route.weekIndex, path: $path)
                        }
                        .navigationDestination(for: LessonRoute.self) { route in
                            LessonView(day: route.day, weekIndex: route.weekIndex, path: $path)
                        }
                        .navigationDestination(for: ExerciseRoute.self) { route in
                            ExerciseView(day: route.day, weekIndex: route.weekIndex)
                        }
                        .navigationDestination(for: PaywallRoute.self) { _ in
                            PaywallView()
                        }
                }
                .tint(ConvoraTheme.accent)
            }
        }
        .background(ConvoraTheme.background)
    }
}
