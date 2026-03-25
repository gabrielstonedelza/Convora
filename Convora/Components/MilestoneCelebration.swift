import SwiftUI

struct MilestoneCelebration: View {
    let completedDay: Int
    let onContinue: () -> Void
    let onShare: () -> Void

    @State private var appeared = false
    @State private var confettiParticles: [ConfettiParticle] = []

    private var milestone: MilestoneData {
        MilestoneData.forDay(completedDay)
    }

    private var weekIndex: Int {
        (completedDay - 1) / 7
    }

    private var weekColor: Color {
        ConvoraTheme.weekColor(weekIndex)
    }

    var body: some View {
        ZStack {
            // Background
            Color.black.opacity(0.92).ignoresSafeArea()

            // Confetti
            confettiView

            // Content
            VStack(spacing: 24) {
                Spacer()

                // Emoji
                Text(milestone.emoji)
                    .font(.system(size: 72))
                    .scaleEffect(appeared ? 1 : 0.3)
                    .animation(.spring(duration: 0.6, bounce: 0.4), value: appeared)

                // Title
                Text(milestone.title)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(ConvoraTheme.textPrimary)
                    .multilineTextAlignment(.center)
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 20)

                // Subtitle
                Text(milestone.subtitle)
                    .font(.system(size: 16))
                    .foregroundStyle(ConvoraTheme.textSecondary)
                    .multilineTextAlignment(.center)
                    .opacity(appeared ? 1 : 0)
                    .offset(y: appeared ? 0 : 20)

                // Week badge
                Text("Week \(weekIndex + 1) Complete")
                    .font(.system(size: 13, weight: .bold))
                    .tracking(1)
                    .foregroundStyle(weekColor)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 8)
                    .background(weekColor.opacity(0.15))
                    .clipShape(Capsule())
                    .opacity(appeared ? 1 : 0)

                Spacer()

                // Buttons
                VStack(spacing: 12) {
                    Button {
                        onContinue()
                    } label: {
                        Text("Continue")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundStyle(.white)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 16)
                            .background(weekColor)
                            .clipShape(RoundedRectangle(cornerRadius: ConvoraTheme.radiusMd, style: .continuous))
                    }
                    .sensoryFeedback(.impact(weight: .medium), trigger: appeared)

                    Button {
                        onShare()
                    } label: {
                        Text("Share Progress")
                            .font(.system(size: 15, weight: .semibold))
                            .foregroundStyle(weekColor)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 14)
                            .overlay(
                                RoundedRectangle(cornerRadius: ConvoraTheme.radiusMd, style: .continuous)
                                    .strokeBorder(weekColor.opacity(0.4), lineWidth: 1.5)
                            )
                    }
                }
                .padding(.horizontal, 24)
                .padding(.bottom, 40)
                .opacity(appeared ? 1 : 0)
            }
        }
        .onAppear {
            generateConfetti()
            withAnimation(.easeOut(duration: 0.8)) {
                appeared = true
            }
        }
    }

    // MARK: - Confetti
    private var confettiView: some View {
        TimelineView(.animation) { timeline in
            Canvas { context, size in
                let time = timeline.date.timeIntervalSinceReferenceDate
                for particle in confettiParticles {
                    let elapsed = time - particle.startTime
                    let progress = elapsed / particle.duration
                    guard progress < 1 else { continue }

                    let x = particle.x * size.width
                    let y = particle.startY + (elapsed * particle.speed)
                    let rotation = Angle.degrees(elapsed * particle.rotationSpeed)

                    context.opacity = 1 - progress
                    context.translateBy(x: x, y: y)
                    context.rotate(by: rotation)

                    let rect = CGRect(x: -4, y: -6, width: 8, height: 12)
                    context.fill(Path(rect), with: .color(particle.color))

                    context.rotate(by: -rotation)
                    context.translateBy(x: -x, y: -y)
                }
            }
        }
        .ignoresSafeArea()
        .allowsHitTesting(false)
    }

    private func generateConfetti() {
        let colors: [Color] = [weekColor, ConvoraTheme.accent, .white, weekColor.opacity(0.7)]
        confettiParticles = (0..<60).map { _ in
            ConfettiParticle(
                x: CGFloat.random(in: 0...1),
                startY: CGFloat.random(in: -100...(-20)),
                speed: CGFloat.random(in: 80...200),
                rotationSpeed: Double.random(in: 100...400),
                duration: Double.random(in: 3...6),
                startTime: Date.now.timeIntervalSinceReferenceDate + Double.random(in: 0...0.5),
                color: colors.randomElement()!
            )
        }
    }
}

// MARK: - Data

private struct ConfettiParticle {
    let x: CGFloat
    let startY: CGFloat
    let speed: CGFloat
    let rotationSpeed: Double
    let duration: Double
    let startTime: TimeInterval
    let color: Color
}

private struct MilestoneData {
    let emoji: String
    let title: String
    let subtitle: String

    static func forDay(_ day: Int) -> MilestoneData {
        switch day {
        case 7:
            return MilestoneData(
                emoji: "🏆",
                title: "Foundation Mastered!",
                subtitle: "You've built the core skills that set great communicators apart."
            )
        case 14:
            return MilestoneData(
                emoji: "⚡",
                title: "Professional Edge Unlocked!",
                subtitle: "You now dominate professional settings with confidence."
            )
        case 21:
            return MilestoneData(
                emoji: "🔥",
                title: "Advanced Mastery Achieved!",
                subtitle: "You can influence, persuade, and lead with clarity."
            )
        case 28:
            return MilestoneData(
                emoji: "🎓",
                title: "Communication Master!",
                subtitle: "You've completed the full 28-day program. You are unstoppable."
            )
        default:
            return MilestoneData(emoji: "🎉", title: "Milestone!", subtitle: "Great progress!")
        }
    }
}
