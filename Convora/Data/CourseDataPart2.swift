import Foundation

/// Extension to CourseData for Weeks 3 and 4
extension CourseData {

    // MARK: - Week 3: Advanced Mastery

    static let week3 = CourseWeek(
        title: "Advanced Mastery",
        subtitle: "Influence, Persuade & Lead",
        weekNumber: 3,
        days: [
            DayLesson(
                day: 15,
                title: "Storytelling for Impact",
                icon: "\u{1F4D6}",
                duration: "15 min",
                lesson: """
                Facts tell. Stories sell. The human brain is wired for narrative — we remember stories 22 times better than facts alone.

                THE STORY FRAMEWORK

                S — Situation: Set the scene quickly. "Last March, I was sitting in a half-empty conference room, about to lose our biggest client."

                T — Tension: Every story needs conflict. What went wrong? What was at stake?

                O — Obstacle: What made the problem hard to solve?

                R — Resolution: How was it resolved? What action was taken?

                Y — Yield: What's the lesson? Connect the story back to the point you're making.

                STORYTELLING RULES

                1. Be specific. "A coffee shop in Portland on a rainy Tuesday" beats "a place somewhere."
                2. Include sensory details. What did you see, hear, feel?
                3. Make yourself vulnerable. Struggle stories are more relatable than victory laps.
                4. Keep it under 2 minutes for conversation, under 5 for presentations.
                5. End with the lesson — always connect back to your point.
                """,
                exercise: Exercise(
                    title: "Story Bank",
                    instructions: "Write 5 personal stories: a failure, a success, a moment of connection, overcoming fear, and a surprising discovery. Structure each using STORY.",
                    challenge: "Tell one of your stories in conversation today. Notice how engagement changes compared to sharing information without a story."
                ),
                keyTakeaways: [
                    "Stories are remembered 22x better than facts",
                    "Use STORY: Situation, Tension, Obstacle, Resolution, Yield",
                    "Vulnerability builds deeper connection",
                    "Keep conversational stories under 2 minutes",
                ]
            ),
            DayLesson(
                day: 16,
                title: "Persuasion & Ethical Influence",
                icon: "\u{1F9E0}",
                duration: "14 min",
                lesson: """
                Persuasion isn't manipulation. It's helping others see value they might have missed.

                THE 6 PRINCIPLES OF ETHICAL PERSUASION

                1. RECIPROCITY — Give first. Share knowledge, help, or resources before asking for anything.

                2. SOCIAL PROOF — Show others have benefited. "80% of our clients saw results in 30 days."

                3. AUTHORITY — Demonstrate expertise through knowledge and results, not titles or commands.

                4. CONSISTENCY — People want to align with previous commitments. "Since quality is your priority, this solution aligns perfectly."

                5. LIKING — We say yes to people we like. Build genuine rapport first.

                6. SCARCITY — Highlight what's unique through genuine differentiation, not false urgency.

                THE PERSUASION CONVERSATION STRUCTURE

                Start by understanding their world. Identify their core need. Connect your idea to that need. Provide evidence (story, data, social proof). Address concerns proactively. Make the next step easy and clear.
                """,
                exercise: Exercise(
                    title: "Ethical Persuasion Map",
                    instructions: "Think of something you want to persuade someone about. Map which of the 6 principles apply. Build your case using at least 3.",
                    challenge: "Use the Persuasion Conversation Structure in a real situation today."
                ),
                keyTakeaways: [
                    "Persuasion is helping others see value — not manipulation",
                    "Give first, ask second (reciprocity)",
                    "Connect your proposal to their stated values",
                    "Always lead with understanding their needs",
                ]
            ),
            DayLesson(
                day: 17,
                title: "Conflict Resolution",
                icon: "\u{1F54A}\u{FE0F}",
                duration: "14 min",
                lesson: """
                Conflict is not the enemy of good relationships — unresolved conflict is. Handled well, conflict strengthens trust and drives better decisions.

                THE PEACE MODEL

                P — Pause: Don't react. Breathe. Count to 5. Let the emotional spike pass.

                E — Examine the root cause. Most conflicts aren't about what they appear to be about. A disagreement about a deadline might be about feeling disrespected.

                A — Acknowledge all perspectives. "I can see that you're feeling frustrated about this, and that makes sense."

                C — Collaborate on solutions. Shift from "me vs. you" to "us vs. the problem." Use: "How can we solve this together?"

                E — Establish agreements. End with clear, specific next steps. Follow up to ensure they hold.

                DE-ESCALATION TECHNIQUES

                Lower your voice (calm is contagious). Slow your pace. Use their name. Find one thing you agree with. Replace "but" with "and" — "I hear your concern AND I'd like to share another perspective."
                """,
                exercise: Exercise(
                    title: "Conflict Replay",
                    instructions: "Replay a recent conflict using the PEACE model. Write what you would have said at each stage. Practice the revised version aloud.",
                    challenge: "Next time you feel friction, consciously Pause for 5 seconds before responding."
                ),
                keyTakeaways: [
                    "Unresolved conflict destroys trust — addressed conflict builds it",
                    "Pause before reacting — every time",
                    "Most conflicts aren't about what they appear to be about",
                    "Shift from \"me vs. you\" to \"us vs. the problem\"",
                ]
            ),
            DayLesson(
                day: 18,
                title: "Cross-Cultural Communication",
                icon: "\u{1F30D}",
                duration: "13 min",
                lesson: """
                Cultural intelligence is no longer optional — it's essential.

                THE 4 DIMENSIONS OF CULTURAL COMMUNICATION

                1. DIRECT vs. INDIRECT: Some cultures value blunt, straightforward communication. Others prefer subtlety and reading between the lines. Neither is superior.

                2. FORMAL vs. INFORMAL: Some cultures expect titles and structure. Others prefer first names and casual exchange. When unsure, start formal.

                3. INDIVIDUAL vs. COLLECTIVE: Some celebrate individual achievement. Others emphasize team accomplishment. Frame communication accordingly.

                4. TIME ORIENTATION: Some cultures are strictly punctual. Others view time as fluid and prioritize relationship-building over schedules.

                THE 3A APPROACH

                Awareness — Recognize your communication style is not universal.
                Adaptation — Adjust your style to bridge gaps without losing your identity.
                Appreciation — Approach differences with curiosity, not judgment. Ask: "How do you prefer to interact?"
                """,
                exercise: Exercise(
                    title: "Cultural Intelligence Builder",
                    instructions: "Research communication norms of a culture different from yours. Write 3 key differences. Plan how you'd adapt for a meeting with someone from that culture.",
                    challenge: "In your next cross-cultural interaction, use the 3A approach. Ask how they prefer to communicate."
                ),
                keyTakeaways: [
                    "Your communication style is not universal",
                    "Start formal, let others set the pace",
                    "Direct vs. indirect — neither is wrong",
                    "Ask people how they prefer to communicate",
                ]
            ),
            DayLesson(
                day: 19,
                title: "Emotional Intelligence in Communication",
                icon: "\u{1F4A1}",
                duration: "15 min",
                lesson: """
                IQ gets you hired. EQ gets you promoted. Emotional intelligence is the ability to recognize, understand, manage, and use emotions effectively.

                THE 4 PILLARS OF COMMUNICATION EQ

                1. SELF-AWARENESS: Know your emotional state in real-time. Before important conversations, check in: "How am I feeling? How might it affect how I communicate?"

                2. SELF-REGULATION: Choose your response rather than reacting automatically. The gap between stimulus and response is where EQ lives. Box breathing: 4 counts in, 4 hold, 4 out, 4 hold.

                3. SOCIAL AWARENESS: Read the room. Notice shifts in energy, unspoken tensions, emotional undercurrents. Watch for body language shifts.

                4. RELATIONSHIP MANAGEMENT: Know when to push and when to pull back. When to challenge and when to support. When to speak and when to listen.

                EMOTIONAL VALIDATION PHRASES

                "That sounds really frustrating."
                "I can see why that would be upsetting."
                "Your feelings about this make complete sense."
                "That took a lot of courage to share."
                "I appreciate your honesty about how you're feeling."
                """,
                exercise: Exercise(
                    title: "EQ Daily Tracker",
                    instructions: "Check your emotional state before every significant conversation today. Note: What am I feeling? How might it affect communication? What do I need to adjust?",
                    challenge: "In your next emotional conversation, use one validation phrase before sharing your perspective."
                ),
                keyTakeaways: [
                    "The gap between stimulus and response is where EQ lives",
                    "Check your emotional state before important conversations",
                    "Validate emotions before solving problems",
                    "Reading the room is a trainable skill",
                ]
            ),
            DayLesson(
                day: 20,
                title: "Public Speaking Without Fear",
                icon: "\u{1F3DB}\u{FE0F}",
                duration: "15 min",
                lesson: """
                Glossophobia affects up to 75% of people. The goal isn't to eliminate fear — it's to use it as fuel.

                THE SPEAK SYSTEM

                S — Structure your talk. Know your opening, 3 key points, and closing by heart.

                P — Practice out loud. Silent reading is not practice. Rehearse at least 5 times. Record yourself.

                E — Engage the audience. Ask questions. Pick 3 friendly faces in different sections for eye contact. Make it about them.

                A — Anchor yourself. Before going on: plant feet, 3 deep breaths, straighten posture, smile.

                K — Keep it conversational. Use contractions, short sentences, stories. Avoid jargon.

                HANDLING MISTAKES

                If you lose your place — pause, breathe, skip to the next point. The audience doesn't know your script.
                If technology fails — acknowledge with humor and keep going. Audiences respect composure.
                Tough questions — "Great question. Let me think about that." Then answer honestly.
                """,
                exercise: Exercise(
                    title: "Rapid-Fire Speaking Drill",
                    instructions: "Set a 2-minute timer. Pick a random topic. Speak for the full 2 minutes without stopping. No planning. Do this 3 times with different topics.",
                    challenge: "Volunteer to present something at work or socially this week. Apply the SPEAK system."
                ),
                keyTakeaways: [
                    "Fear is fuel — channel it, don't fight it",
                    "Practice out loud at least 5 times",
                    "The audience doesn't know your script",
                    "The best speeches sound like conversations",
                ]
            ),
            DayLesson(
                day: 21,
                title: "Week 3 Integration & Practice",
                icon: "\u{1F504}",
                duration: "16 min",
                lesson: """
                Three weeks in. You now possess advanced communication tools that set you apart.

                YOUR WEEK 3 TOOLKIT

                STORY framework for storytelling
                6 Principles of ethical persuasion
                PEACE model for conflict resolution
                4 Dimensions of cultural intelligence
                4 Pillars of emotional intelligence
                SPEAK system for public speaking

                ADVANCED INTEGRATION CHALLENGE

                You're leading a team meeting with members from 3 countries. One is frustrated about a delay, another pushes a different approach, and you need everyone aligned.

                1. Read the room with EQ (Day 19)
                2. Adapt for cultural differences (Day 18)
                3. Resolve conflict with PEACE (Day 17)
                4. Persuade ethically (Day 16)
                5. Tell a story to inspire alignment (Day 15)
                6. Present to leadership using SPEAK (Day 20)

                THE GROWTH MINDSET CHECKPOINT

                By now conversations should feel smoother, people respond differently, and you have more confidence in handling any interaction. These are real changes. Trust them.
                """,
                exercise: Exercise(
                    title: "Advanced Scenario Walk-Through",
                    instructions: "Walk through the complete team scenario. Write your approach for each step. Practice the leadership presentation aloud.",
                    challenge: "Rate yourself 1-10 on all Week 3 skills. Compare to Week 1 ratings."
                ),
                keyTakeaways: [
                    "Advanced skills layer on fundamentals — keep practicing both",
                    "Real scenarios require combining multiple frameworks fluidly",
                    "Growth feels awkward before it feels natural",
                    "Compare your confidence now to Day 1",
                ]
            ),
        ]
    )

    // MARK: - Week 4: Leadership & Mastery

    static let week4 = CourseWeek(
        title: "Leadership & Mastery",
        subtitle: "Become Unforgettable",
        weekNumber: 4,
        days: [
            DayLesson(
                day: 22,
                title: "Leadership Communication",
                icon: "\u{1F451}",
                duration: "14 min",
                lesson: """
                Leadership isn't a title — it's a communication style.

                THE 5 COMMUNICATION HABITS OF GREAT LEADERS

                1. CLARITY OVER CLEVERNESS: Short sentences. Simple words. No jargon. If a 12-year-old can't understand your direction, simplify it.

                2. VISION CASTING: Connect tasks to meaning. "We're not building a feature — we're giving 10,000 small businesses the ability to manage finances without an accountant."

                3. DECISIVE COMMUNICATION: Make decisions and communicate them clearly. Hedging erodes confidence.

                4. ACCESSIBLE TRANSPARENCY: Share proactively. "Here's what I know, what I don't know, and when I'll have more."

                5. EMPOWERING LANGUAGE: Use "we" more than "I." Give credit publicly, take blame privately. Ask "What do you think?" and mean it.

                COMMUNICATING IN CRISIS — THE CARE MODEL

                C — Control: Take charge of the narrative.
                A — Acknowledge: Name the problem directly.
                R — Reassure: Share what's being done.
                E — Engage: Ask for input and support.
                """,
                exercise: Exercise(
                    title: "Leadership Voice Practice",
                    instructions: "Rewrite 3 recent communications using the 5 leadership habits. Replace jargon with clarity. Add vision context.",
                    challenge: "In your next interaction, use vision casting. Connect a task to a bigger purpose."
                ),
                keyTakeaways: [
                    "Clarity over cleverness — always",
                    "Connect every task to why it matters",
                    "Share information proactively to build trust",
                    "Use \"we\" more than \"I\"",
                ]
            ),
            DayLesson(
                day: 23,
                title: "Sales & Pitch Communication",
                icon: "\u{1F48E}",
                duration: "14 min",
                lesson: """
                Whether selling a product, pitching an idea, or interviewing — understand the audience, demonstrate value, make saying yes easy.

                THE PITCH FRAMEWORK

                P — Problem: Articulate their problem better than they can. "You're spending 15 hours a week on reports that should take 2."

                I — Impact: Quantify the cost. "That's 780 hours a year — $50,000 in lost productivity per person."

                T — Transformation: Paint the after picture. "Your team focuses on strategy instead of spreadsheets."

                C — Credibility: Prove it works. Case studies, testimonials, data, demonstrations.

                H — Handoff: Make the next step frictionless. "I can set up a 15-minute pilot this week. No commitment required."

                THE ANTI-PITCH MINDSET

                Stop trying to convince — start trying to help. Ask more questions than you make statements. If your solution isn't right for them, say so. Honesty builds a reputation that sells long-term.
                """,
                exercise: Exercise(
                    title: "The 60-Second Pitch",
                    instructions: "Choose something to \"sell.\" Build a 60-second pitch using PITCH. Deliver to 3 people and ask which part was most compelling.",
                    challenge: "Use PITCH in a real situation this week."
                ),
                keyTakeaways: [
                    "Articulate their problem better than they can",
                    "Quantify the cost of inaction",
                    "Be a trusted advisor, not a salesperson",
                    "Make saying yes frictionless",
                ]
            ),
            DayLesson(
                day: 24,
                title: "Digital & Social Communication",
                icon: "\u{1F4F1}",
                duration: "12 min",
                lesson: """
                Digital communication is the default. Mastering screens, messages, and platforms is essential.

                VIDEO CALL MASTERY

                Camera at eye level. Light source in front, not behind. Clean background. Look at the camera when speaking, not their face. Mute when not speaking. Use hand gestures within the frame.

                TEXT & CHAT COMMUNICATION

                Match channel to message: Quick FYI = Slack/text. Detailed request = email. Sensitive topic = call/video.
                Read your message in the worst possible tone before sending. Rewrite if it could be misinterpreted.
                Response time signals priority. Set expectations: "I'll review this by end of day."

                BUILDING A DIGITAL PRESENCE

                Every post contributes to your reputation. Ask: "If 1,000 people saw this, would I be proud?" Post with intention. Share knowledge generously. Be known for adding value, not noise.

                THE ASYNCHRONOUS ADVANTAGE

                Digital communication gives you time to think before responding. Draft, revise, refine. Use this superpower.
                """,
                exercise: Exercise(
                    title: "Digital Communication Audit",
                    instructions: "Review your last 20 sent messages. For each: Was the channel right? Could the tone be misread? Was it clear? Rewrite 3.",
                    challenge: "Set up your video call environment for maximum impact. Do a test recording and review."
                ),
                keyTakeaways: [
                    "Match the channel to the message sensitivity",
                    "Read messages in the worst possible tone before sending",
                    "Video: camera at eye level, light in front, clean background",
                    "Digital gives you time to think — use it",
                ]
            ),
            DayLesson(
                day: 25,
                title: "Strategic Networking",
                icon: "\u{1F310}",
                duration: "13 min",
                lesson: """
                Networking isn't collecting business cards — it's building genuine relationships that create mutual value.

                THE VALUE NETWORKING METHOD

                V — Volunteer value first. Before asking anything, offer: an introduction, an article, advice, or a genuine compliment.

                A — Ask great questions. "What project are you most excited about right now?" stands out because nobody asks it.

                L — Link people together. The most powerful networkers are connectors. Think: "Who in my network would benefit from knowing this person?"

                U — Update regularly. Don't only reach out when you need something. Send relevant articles with "Thought of you."

                E — Exit gracefully. Keep conversations to 5-10 minutes. End warmly and follow up within 48 hours.

                THE FOLLOW-UP FORMULA

                Within 48 hours: Brief email referencing your conversation.
                Within 2 weeks: Share something of value.
                Within 2 months: Check in with genuine interest.
                This cadence builds relationships that compound over years.
                """,
                exercise: Exercise(
                    title: "Network Map",
                    instructions: "List your 20 most valuable connections. When did you last reach out? What value could you offer now? Message 5 neglected connections today.",
                    challenge: "Use VALUE at a networking event this week. Follow up within 48 hours."
                ),
                keyTakeaways: [
                    "Give value before you ask for anything",
                    "Be the connector — introduce people to each other",
                    "Follow up within 48 hours or the connection fades",
                    "Network maintenance > network building",
                ]
            ),
            DayLesson(
                day: 26,
                title: "Crisis Communication",
                icon: "\u{1F6A8}",
                duration: "13 min",
                lesson: """
                How you communicate when things go wrong defines your reputation more than when things go right.

                THE RAPID RESPONSE MODEL

                R — Respond quickly. Silence is interpreted as incompetence, indifference, or guilt. You don't need all answers to respond.

                A — Acknowledge the situation. Don't minimize, deny, or deflect. "We're aware of the issue and taking it seriously."

                P — Provide facts. Share what you know, what you don't, and when you'll know more. Stick to facts.

                I — Indicate responsibility. "This was our mistake and we're committed to making it right." Leading with accountability builds trust.

                D — Detail the path forward. What are you doing about it? What prevents recurrence? Be specific.

                THE ONE-VOICE PRINCIPLE

                In a crisis, designate one spokesperson. Mixed messages create confusion. After the dust settles, communicate what was learned and what's changing.
                """,
                exercise: Exercise(
                    title: "Crisis Simulation",
                    instructions: "Imagine a realistic crisis. Write a RAPID response: initial statement, facts update, and path-forward communication. Practice delivering each aloud.",
                    challenge: "Revisit a past crisis you handled. How would you communicate differently now?"
                ),
                keyTakeaways: [
                    "Silence in crisis is interpreted as guilt or incompetence",
                    "Acknowledge first, explain second, fix third",
                    "Take ownership — people forgive honesty, not cover-ups",
                    "One voice, one message in crisis situations",
                ]
            ),
            DayLesson(
                day: 27,
                title: "Personal Brand Communication",
                icon: "\u{2B50}",
                duration: "13 min",
                lesson: """
                Your personal brand is what people say about you when you're not in the room.

                THE BRAND FRAMEWORK

                B — Be clear on your message. What do you want to be known for? Choose one core message and align all communication around it.

                R — Repeat consistently. Your message should show up everywhere — introductions, stories, content you share.

                A — Authenticity is non-negotiable. Your brand must be genuine. Lean into actual strengths. The most powerful brands are amplified truth.

                N — Narrate your journey. Share process, not just results. People connect with struggle and growth.

                D — Deliver value relentlessly. Every communication should leave the other person slightly better off. Over time, you become associated with value.

                YOUR COMMUNICATION SIGNATURE

                Develop 2-3 phrases, questions, or habits that become distinctly "you." Maybe you start meetings with "What's the one thing we must accomplish today?" Small consistencies make you memorable.
                """,
                exercise: Exercise(
                    title: "Brand Blueprint",
                    instructions: "Answer: 1) What do I want to be known for? 2) 3 communication habits that reinforce it? 3) Habits that undermine it? 4) My communication signature?",
                    challenge: "Ask 5 people: \"In one sentence, how would you describe my communication style?\" Compare to your intended brand."
                ),
                keyTakeaways: [
                    "Your brand is what people say when you leave the room",
                    "Consistency builds recognition",
                    "Authenticity is amplified truth",
                    "Every interaction is a chance to deliver value",
                ]
            ),
            DayLesson(
                day: 28,
                title: "Graduation: Your Communication Mastery Plan",
                icon: "\u{1F393}",
                duration: "18 min",
                lesson: """
                You did it. 28 days of intensive communication training. You've built a toolkit that most people never access in their entire lifetime.

                YOUR COMPLETE TOOLKIT — 18+ FRAMEWORKS

                WEEK 1 FOUNDATION: 7-Second Formula, HEAR Framework, 6 Channels of Body Language, 5 Dimensions of Vocal Power, RAPPORT Method, Question Hierarchy

                WEEK 2 PROFESSIONAL: CLEAR Email Framework, PEP Method, 3-Act Presentation Structure, WIN Negotiation Framework, BRAVE Difficult Conversation Model, SBI Feedback Model

                WEEK 3 ADVANCED: STORY Framework, 6 Principles of Ethical Persuasion, PEACE Conflict Model, 4 Dimensions of Cultural Intelligence, 4 Pillars of EQ, SPEAK Public Speaking System

                WEEK 4 MASTERY: 5 Leadership Habits, PITCH Framework, Digital Communication Mastery, VALUE Networking Method, RAPID Crisis Communication, BRAND Personal Brand Framework

                YOUR 90-DAY MASTERY PLAN

                Days 29-45: Practice 1 framework per day. Rotate through all 18.
                Days 46-60: Focus on your 3 weakest areas with extra practice.
                Days 61-90: Integration. Frameworks become instinct. You don't think about HEAR — you just listen at Level 4 naturally.

                THE FINAL TRUTH

                Communication mastery is not a destination — it's a practice. The best communicators are still learning and refining. You now have the tools and the foundation. The rest is commitment and repetition.

                Go communicate with courage. Connect with depth. Lead with clarity.
                """,
                exercise: Exercise(
                    title: "The Final Assessment",
                    instructions: "Rate yourself 1-10 on all 18 frameworks. Write a personal communication mission statement in one sentence. Share it with someone you trust.",
                    challenge: "Commit to one communication practice every day for the next 90 days. Put it in your calendar. Make it non-negotiable."
                ),
                keyTakeaways: [
                    "You've built a toolkit of 18+ professional frameworks",
                    "Days 29-90: Practice, focus on weaknesses, then integrate",
                    "Communication mastery is a daily practice, not a destination",
                    "Go communicate with courage, depth, and clarity",
                ]
            ),
        ]
    )
}
