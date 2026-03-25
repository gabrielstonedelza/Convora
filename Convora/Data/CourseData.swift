import Foundation

/// Full 28-day communication mastery curriculum
/// Created by a professional communications expert framework
enum CourseData {
    static let weeks: [CourseWeek] = [week1, week2, week3, week4]

    static var allDays: [DayLesson] {
        weeks.flatMap { $0.days }
    }

    // MARK: - Week 1: Foundation

    static let week1 = CourseWeek(
        title: "Foundation",
        subtitle: "Build Your Communication Core",
        weekNumber: 1,
        days: [
            DayLesson(
                day: 1,
                title: "The Power of First Impressions",
                icon: "\u{1F44B}",
                duration: "12 min",
                lesson: """
                First impressions form in just 7 seconds. In that brief window, people decide whether they trust you, respect you, and want to engage with you. This isn't superficial — it's deeply wired into human psychology.

                THE THREE PILLARS OF A STRONG FIRST IMPRESSION

                1. PRESENCE — Before you say a word, your energy speaks. Stand tall with shoulders back and relaxed. Keep your chin level, not tilted up or down. Plant your feet shoulder-width apart. This signals confidence without arrogance.

                2. THE OPENING — Your first sentence sets the frame for the entire interaction. Avoid weak openers like "Sorry to bother you" or "You probably don't remember me." Instead, lead with warmth and clarity: "Great to meet you — I've been looking forward to this conversation."

                3. AUTHENTIC ENGAGEMENT — People remember how you made them feel, not what you said. Focus entirely on the other person for the first 30 seconds. Ask about them. Show genuine curiosity. This shifts the dynamic from transactional to human.

                THE 7-SECOND FORMULA

                Second 1-2: Smile naturally before speaking.
                Second 3-4: Make confident eye contact.
                Second 5-6: Offer a firm (not crushing) handshake or warm greeting.
                Second 7: Deliver your opening line with clarity.

                COMMON MISTAKES THAT DESTROY FIRST IMPRESSIONS

                Checking your phone during introductions. Giving a limp handshake or avoiding eye contact. Talking about yourself immediately. Complaining or being negative in your opener. Fidgeting, crossing arms, or looking around the room.
                """,
                exercise: Exercise(
                    title: "Mirror Practice",
                    instructions: "Stand in front of a mirror. Practice introducing yourself to a stranger, a business contact, and a potential client. Record yourself and watch for body language signals. Do this 5 times for each scenario.",
                    challenge: "Tomorrow, use the 7-Second Formula with the first person you meet. Note their reaction."
                ),
                keyTakeaways: [
                    "First impressions form in 7 seconds — own every one of them",
                    "Presence speaks louder than words",
                    "Lead with genuine curiosity about the other person",
                    "Eliminate weak openers from your vocabulary permanently",
                ]
            ),
            DayLesson(
                day: 2,
                title: "Active Listening Mastery",
                icon: "\u{1F442}",
                duration: "15 min",
                lesson: """
                Most people listen to respond. Elite communicators listen to understand. This single shift will transform every relationship and conversation in your life.

                THE 4 LEVELS OF LISTENING

                LEVEL 1 — COSMETIC LISTENING: You're physically present but mentally elsewhere. Nodding while planning what to say next. This is where 80% of people operate. It's insulting to the speaker and you miss critical information.

                LEVEL 2 — CONVERSATIONAL LISTENING: You hear the words and respond to the content. Better, but you're still only processing surface-level meaning. You catch the "what" but miss the "why."

                LEVEL 3 — ACTIVE LISTENING: You hear the words, the emotions behind them, and the unspoken message. You reflect back what you hear and ask clarifying questions. This is where trust is built.

                LEVEL 4 — EMPATHIC LISTENING: You listen with your entire being. You understand the speaker's perspective so deeply that they feel truly seen and heard. This is the level that creates lasting bonds and influence.

                THE HEAR FRAMEWORK

                H — Halt: Stop everything. Put down your phone. Close your laptop. Turn your body toward the speaker. Give them 100% of your attention.

                E — Empathize: Put yourself in their position. What are they feeling? What's driving their words? Look for the emotion underneath the content.

                A — Anticipate with patience: Don't jump ahead. Don't finish their sentences. Let them arrive at their point in their own time. Silence is not uncomfortable — it's respectful.

                R — Reflect: Mirror back what you heard. "What I'm hearing is..." or "It sounds like you're saying..." This confirms understanding and shows the speaker they matter.

                POWER PHRASES FOR ACTIVE LISTENING

                "Tell me more about that."
                "What did that mean to you?"
                "How did that make you feel?"
                "Help me understand your perspective."
                "What's the most important part of this for you?"
                """,
                exercise: Exercise(
                    title: "The 5-Minute Challenge",
                    instructions: "Have a conversation with someone for 5 minutes where your ONLY goal is to understand them deeply. Do not share your own opinions or stories. Only ask questions and reflect back what you hear.",
                    challenge: "Practice HEAR with 3 different conversations today. Rate yourself 1-4 on the listening levels after each one."
                ),
                keyTakeaways: [
                    "Listen to understand, not to respond",
                    "Level 4 empathic listening creates the deepest connections",
                    "The HEAR framework: Halt, Empathize, Anticipate, Reflect",
                    "Silence is a power tool, not an awkward gap",
                ]
            ),
            DayLesson(
                day: 3,
                title: "Body Language Decoded",
                icon: "\u{1F9CD}",
                duration: "14 min",
                lesson: """
                Research from UCLA suggests that up to 55% of communication is body language, 38% is tone of voice, and only 7% is the actual words. If you're only focused on what to say, you're ignoring 93% of the conversation.

                THE 6 CHANNELS OF BODY LANGUAGE

                1. FACIAL EXPRESSIONS — Your face broadcasts emotions you might not even be aware of. Micro-expressions flash in 1/25th of a second. A genuine smile (Duchenne smile) crinkles the eyes — people instinctively know the difference.

                2. EYE CONTACT — The single most powerful non-verbal tool. The 60/40 rule: maintain eye contact 60% of the time while speaking, 70% while listening. Looking away frequently signals discomfort. Staring without breaks feels aggressive. Find the balance.

                3. POSTURE — Open posture (uncrossed arms, facing the speaker, leaning slightly forward) signals engagement and confidence. Closed posture (crossed arms, turned away, leaning back) signals defensiveness or disinterest.

                4. GESTURES — Purposeful hand movements add emphasis and clarity. Open palms signal honesty. Steepling fingers shows confidence. Keep gestures within your "power zone" — the box between your shoulders and waist.

                5. PROXEMICS (SPACE) — Intimate zone: 0-18 inches. Personal zone: 18 inches to 4 feet. Social zone: 4-12 feet. Violating someone's zone creates discomfort. Respecting it builds trust.

                6. TOUCH — A brief, appropriate touch on the arm or shoulder increases trust and likeability. But context matters enormously — read the situation and cultural norms carefully.

                READING OTHERS

                When someone's words and body language conflict, trust the body. If someone says "I'm fine" with crossed arms and a clenched jaw, they're not fine. This awareness gives you a massive advantage in negotiations, interviews, and relationships.
                """,
                exercise: Exercise(
                    title: "People Watching Lab",
                    instructions: "Go to a public place. Observe 5 different conversations from a distance. Write down what you notice about each person's body language. Then practice open, confident posture for 10 minutes during a conversation.",
                    challenge: "Record a 2-minute video of yourself explaining something you're passionate about. Watch it on mute. What does your body say?"
                ),
                keyTakeaways: [
                    "93% of communication is non-verbal",
                    "Master the 6 channels: face, eyes, posture, gestures, space, touch",
                    "When words and body conflict, trust the body",
                    "Open posture is your default power stance",
                ]
            ),
            DayLesson(
                day: 4,
                title: "Voice Mastery: Tone, Pace & Power",
                icon: "\u{1F399}\u{FE0F}",
                duration: "13 min",
                lesson: """
                Your voice is an instrument. Most people play one note their entire lives. Today you learn to play the full range.

                THE 5 DIMENSIONS OF VOCAL POWER

                1. TONE — Your emotional fingerprint. A warm tone opens doors. A cold tone closes them. Practice shifting between authoritative (lower pitch, measured pace), friendly (slightly higher pitch, varied inflection), and persuasive (moderate pitch with strategic emphasis).

                2. PACE — Average speaking rate is 125-150 words per minute. Slow down for important points — it signals gravity. Speed up for excitement and energy. The contrast creates engagement.

                3. VOLUME — Projection is not shouting. It's speaking from your diaphragm with intention. Drop your volume when you want someone to lean in and pay close attention.

                4. PITCH — Monotone kills attention. Vary your pitch naturally by emphasizing key words. A slight downward pitch at the end of sentences conveys confidence and authority. Avoid upspeak.

                5. PAUSES — The most underused vocal tool. A 2-3 second pause before an important point creates anticipation. A pause after a key statement gives it weight. Pauses replace filler words.

                THE VOCAL WARM-UP ROUTINE (Do This Daily)

                Hum for 30 seconds to warm your vocal cords. Say "red leather, yellow leather" 10 times fast for articulation. Read a paragraph aloud emphasizing every third word for pitch variety. Record yourself saying "I believe this is the right direction" in 3 tones: confident, empathetic, and urgent.

                KILLING FILLER WORDS

                Replace every "um" and "uh" with a pause. It feels uncomfortable at first, but a silent pause sounds confident while fillers sound uncertain. Record yourself in conversations for a week and count your fillers.
                """,
                exercise: Exercise(
                    title: "Voice Journal",
                    instructions: "Record yourself reading the same paragraph 4 different ways: as a news anchor, as a motivational speaker, as a storyteller, and as a CEO. Listen to the differences. Which elements could you integrate?",
                    challenge: "For 24 hours, consciously use 2-second pauses instead of filler words. Ask a friend to count your \"ums\" in a 5-minute conversation."
                ),
                keyTakeaways: [
                    "Your voice has 5 dimensions — master all of them",
                    "Pauses are more powerful than filler words",
                    "Pace variation keeps listeners engaged",
                    "Daily vocal warm-ups transform your delivery over time",
                ]
            ),
            DayLesson(
                day: 5,
                title: "Building Instant Rapport",
                icon: "\u{1F91D}",
                duration: "14 min",
                lesson: """
                Rapport is the invisible bridge between two people. When it's there, communication flows effortlessly. When it's absent, even perfect words feel empty.

                THE RAPPORT METHOD

                R — Reflect their energy. If someone is calm and measured, match that energy. If they're enthusiastic, bring your energy up. Mismatched energy creates friction.

                A — Ask about their world. People's favorite topic is themselves. Ask questions about their experiences, opinions, and feelings.

                P — Pay full attention. Put everything else away. Face them fully. Nod at appropriate moments. Use brief verbal affirmations.

                P — Pick up on values. Listen for what matters to them. When someone says "I worked weekends to get this done," they value dedication. Acknowledge it.

                O — Open your posture and energy. Uncross your arms. Lean slightly forward. Smile genuinely. Remove barriers.

                R — Remember details. Use their name. Reference something they mentioned earlier. Follow up on previous conversations.

                T — Timing. Don't rush rapport. Some people open up quickly; others need time. Read the pace and respect it.

                ADVANCED TECHNIQUE — MIRRORING

                Subtly match the other person's body language, speaking pace, and energy level. Do this naturally, not robotically. The other person unconsciously feels "this person is like me" which triggers trust.
                """,
                exercise: Exercise(
                    title: "The Rapport Experiment",
                    instructions: "Have 3 conversations today. In the first, intentionally mismatch energy. In the second, match perfectly. In the third, use the full RAPPORT method. Journal the differences.",
                    challenge: "Find someone you've struggled to connect with. Apply RAPPORT consciously. Notice what shifts."
                ),
                keyTakeaways: [
                    "Rapport is built through matching energy and genuine interest",
                    "Mirror neurons are your secret weapon for connection",
                    "Remember and reference personal details — it shows you care",
                    "Timing matters — don't force connection",
                ]
            ),
            DayLesson(
                day: 6,
                title: "The Art of Powerful Questions",
                icon: "\u{2753}",
                duration: "12 min",
                lesson: """
                The quality of your questions determines the quality of your conversations. Average communicators make statements. Exceptional communicators ask transformative questions.

                THE QUESTION HIERARCHY

                LEVEL 1 — CLOSED QUESTIONS: "Did you like it?" These get yes/no answers and kill conversations. Use sparingly.

                LEVEL 2 — OPEN QUESTIONS: "What did you think of it?" These invite explanation and sharing. Start with What, How, Tell me about.

                LEVEL 3 — PROBING QUESTIONS: "What specifically made you feel that way?" These dig deeper and show genuine intellectual curiosity.

                LEVEL 4 — TRANSFORMATIVE QUESTIONS: "What would change if you approached this from the opposite direction?" These shift perspective and create breakthroughs.

                QUESTIONS THAT BUILD RELATIONSHIPS

                "What's exciting you most right now?"
                "What's been your biggest challenge this week?"
                "If you could change one thing about how we work together, what would it be?"
                "What does success look like for you in this?"
                "What's the story behind that?"

                THE FOLLOW-UP RULE

                The magic is never in the first question — it's in the follow-up. "Tell me more about that." "What happened next?" Three levels of follow-up is where real connection and insight emerge.
                """,
                exercise: Exercise(
                    title: "Question Upgrade",
                    instructions: "Write down 10 questions you commonly ask. Rewrite each one to be at least one level higher on the Question Hierarchy. Use your upgraded questions in at least 3 conversations today.",
                    challenge: "In your next important conversation, ask only questions for the first 5 minutes. No statements. Only questions."
                ),
                keyTakeaways: [
                    "Move up the Question Hierarchy — from closed to transformative",
                    "The follow-up question is where the real gold is",
                    "Start questions with What and How, not Why",
                    "Three levels of follow-up creates genuine depth",
                ]
            ),
            DayLesson(
                day: 7,
                title: "Week 1 Integration & Practice",
                icon: "\u{1F504}",
                duration: "16 min",
                lesson: """
                Congratulations — you've completed the Foundation week. You now have tools that 90% of people never learn. This day is about integration and rehearsal.

                YOUR WEEK 1 TOOLKIT

                The 7-Second Formula for first impressions
                The HEAR Framework for active listening
                The 6 Channels of body language
                The 5 Dimensions of vocal power
                The RAPPORT Method for instant connection
                The Question Hierarchy for deeper conversations

                INTEGRATION EXERCISE — THE COMPLETE SCENARIO

                Imagine walking into a networking event where you know nobody. You spot someone standing alone near the refreshment table. Walk through the entire interaction:

                1. APPROACH with confident body language — open posture, natural smile, purposeful walk.
                2. FIRST IMPRESSION — Use the 7-Second Formula. Lead with warmth.
                3. BUILD RAPPORT — Match their energy, ask about their world, pay full attention.
                4. LISTEN ACTIVELY — Use the HEAR framework.
                5. ASK POWERFUL QUESTIONS — Start with Level 2, then probe deeper.
                6. USE YOUR VOICE — Vary tone, pace strategically, pause instead of fillers.

                THE COMPOUND EFFECT

                Communication skills compound like interest. A 1% improvement each day means you'll be 37 times better in a year. Trust the process.

                WEEK 1 SELF-ASSESSMENT

                Rate yourself 1-10 on each skill: First Impressions, Listening, Body Language, Voice, Rapport, Questions. Identify your two weakest areas — those become your priority next week.
                """,
                exercise: Exercise(
                    title: "Complete Integration Drill",
                    instructions: "Role-play the networking scenario with a friend or in front of a mirror. Go through all 6 steps. Then swap roles and observe. Debrief on what felt natural and what needs work.",
                    challenge: "Rate yourself 1-10 on each Week 1 skill. Share your self-assessment with someone you trust."
                ),
                keyTakeaways: [
                    "Knowledge without practice is worthless — rehearse daily",
                    "Communication skills compound over time",
                    "Identify your 2 weakest areas and prioritize them",
                    "Integration of all skills simultaneously is the goal",
                ]
            ),
        ]
    )

    // MARK: - Week 2: Professional Edge

    static let week2 = CourseWeek(
        title: "Professional Edge",
        subtitle: "Dominate Professional Settings",
        weekNumber: 2,
        days: [
            DayLesson(
                day: 8,
                title: "Email & Written Communication",
                icon: "\u{2709}\u{FE0F}",
                duration: "13 min",
                lesson: """
                Written communication is your 24/7 representative. Every email, message, and document either builds or erodes your professional reputation.

                THE CLEAR EMAIL FRAMEWORK

                C — Concise subject line: "Meeting Tomorrow" is weak. "Action Required: Q3 Budget Review — Tuesday 2pm" is strong. Be specific, include deadlines, signal priority.

                L — Lead with the point: First sentence should contain your request or key information. "I need your approval on the revised budget by Friday."

                E — Easy to scan: Short paragraphs (2-3 sentences). Bold key dates, names, and action items. Use bullet points for lists.

                A — Action-oriented close: "Please reply with your approval by Thursday 5pm" is clear. "Let me know your thoughts" is vague.

                R — Review before sending: Read once for content, once for tone, once for errors. Ask: "If I received this in a bad mood, how would I interpret it?"

                TONE CALIBRATION

                Too formal: "Per our earlier discourse, I wish to ascertain..." (pretentious)
                Too casual: "Hey, so like, about that thing..." (unprofessional)
                Just right: "Following up on our conversation — here's what I'm proposing..." (clear, respectful, direct)

                THE 24-HOUR RULE

                Never send an emotional email immediately. Draft it, save it, review it the next day. You'll almost always revise it significantly.
                """,
                exercise: Exercise(
                    title: "Email Audit",
                    instructions: "Pull up your last 10 sent emails. Score each against the CLEAR framework. Rewrite your 3 worst emails.",
                    challenge: "Write tomorrow's most important email using CLEAR. Aim for under 5 minutes."
                ),
                keyTakeaways: [
                    "Lead with your point — don't make people hunt for it",
                    "Subject lines are headlines — make them specific and actionable",
                    "The 24-Hour Rule saves careers",
                    "Tone sits between formal and casual — professional warmth",
                ]
            ),
            DayLesson(
                day: 9,
                title: "Commanding Meetings",
                icon: "\u{1F4BC}",
                duration: "14 min",
                lesson: """
                Most meetings are where productivity goes to die. The person who communicates best gets disproportionate influence, visibility, and career momentum.

                BEFORE THE MEETING

                Know the agenda and your role. Prepare 2-3 key points. Arrive 2 minutes early. Choose your seat strategically — near the decision-maker.

                THE FIRST 3 MINUTES RULE

                The tone of a meeting is set in the first 3 minutes. If you can contribute something valuable in this window — a key insight, a sharp question — you establish yourself as a player for the rest.

                THE PEP METHOD FOR SPEAKING UP

                P — Point: State your main idea in one clear sentence.
                E — Evidence: Support it with one fact, example, or data point.
                P — Proposal: End with what you recommend.

                Example: "I think we should delay the launch by two weeks. Our beta testing revealed 3 critical bugs affecting 40% of users. I propose we fix those bugs and run a second beta round before going live."

                HANDLING INTERRUPTIONS

                If interrupted: Pause, let them finish, then say "As I was saying..." and continue.
                If someone takes credit: "I'm glad you agree with what I proposed earlier — let me build on that."
                If put on the spot: "That's a great question. Let me think about that for a moment."

                AFTER THE MEETING

                Follow up within 24 hours with a brief summary of decisions and action items. This positions you as organized and reliable.
                """,
                exercise: Exercise(
                    title: "Meeting Prep Blueprint",
                    instructions: "Before your next meeting: 1) Write 3 key points in PEP format, 2) Questions to ask, 3) Who to influence and how.",
                    challenge: "Make one PEP contribution in the first 3 minutes of your next meeting."
                ),
                keyTakeaways: [
                    "Set the tone in the first 3 minutes",
                    "Use PEP: Point, Evidence, Proposal",
                    "Never be unprepared — know your talking points",
                    "Follow up within 24 hours to solidify your presence",
                ]
            ),
            DayLesson(
                day: 10,
                title: "Presentation Skills That Captivate",
                icon: "\u{1F3A4}",
                duration: "15 min",
                lesson: """
                Great presentations don't inform — they transform. The difference between forgettable and career-defining is structure, storytelling, and delivery.

                THE 3-ACT PRESENTATION STRUCTURE

                ACT 1 — THE HOOK (10% of your time): Open with something unexpected: a startling statistic, a provocative question, a brief personal story. Never open with "Today I'm going to talk about..." — that's a sleeping pill in sentence form.

                ACT 2 — THE JOURNEY (80%): Organize content into 3 main points (never more than 5). For each: state clearly, support with evidence or story, connect back to your central message.

                ACT 3 — THE LANDING (10%): Summarize your 3 points. Close with a call to action, a memorable quote, or a callback to your opening hook. The last thing you say is the first thing they remember.

                DELIVERY MASTERY

                Move with purpose — don't pace randomly. Make eye contact with individuals, not the crowd. Hold for 3-5 seconds per person. Use slides as visuals, not scripts — 6 words max. Embrace silence — pause after key points for 3 full seconds.

                CONQUERING NERVES

                Nervousness is energy without direction. Channel it: arrive early, do vocal warm-ups, remind yourself the audience wants you to succeed. Focus on serving the audience, not performing for them.
                """,
                exercise: Exercise(
                    title: "The 3-Minute Talk",
                    instructions: "Choose any topic. Build a 3-minute presentation using the 3-Act Structure. Deliver it, then record and review for body language and vocal variety.",
                    challenge: "Give your talk to someone new. Ask them to rate hook, clarity, and closing impact 1-10."
                ),
                keyTakeaways: [
                    "Open with a hook, never \"Today I'm going to talk about...\"",
                    "3 main points maximum for audience retention",
                    "Slides are visuals, not scripts",
                    "Channel nervousness into purposeful energy",
                ]
            ),
            DayLesson(
                day: 11,
                title: "Negotiation Fundamentals",
                icon: "\u{2696}\u{FE0F}",
                duration: "14 min",
                lesson: """
                Every conversation is a negotiation. The best negotiators don't fight to win; they work to find solutions that make both parties feel valued.

                THE WIN FRAMEWORK

                W — Want: Know exactly what you want before the conversation starts. What's your ideal outcome? Your minimum acceptable outcome? Your BATNA — Best Alternative to a Negotiated Agreement?

                I — Interests: Understand the other party's interests, not just their position. Position is what they say they want. Interest is why they want it. Address the interest, and the position becomes flexible.

                N — Navigate: Steer toward mutual benefit. "How can we make this work for both of us?" Avoid ultimatums and zero-sum thinking.

                POWER PHRASES

                "Help me understand your perspective on this."
                "What would need to be true for you to feel great about this?"
                "I want to find a solution that works for both of us."
                "Let me think about that and come back to you."

                THE SILENCE WEAPON

                After making a proposal, stop talking. Silence creates productive discomfort. The first person to speak after a proposal usually concedes.
                """,
                exercise: Exercise(
                    title: "Negotiation Prep Sheet",
                    instructions: "Think of an upcoming negotiation. Complete the WIN framework: Write your Want, identify their Interests, plan your Navigation strategy. Role-play it.",
                    challenge: "Use strategic silence in your next negotiation. After a request, wait 5 full seconds."
                ),
                keyTakeaways: [
                    "Know your BATNA before every negotiation",
                    "Address interests, not positions",
                    "Silence after a proposal is your greatest weapon",
                    "Frame everything as mutual problem-solving",
                ]
            ),
            DayLesson(
                day: 12,
                title: "Navigating Difficult Conversations",
                icon: "\u{1F30A}",
                duration: "15 min",
                lesson: """
                The conversations we avoid are usually the ones we need most. Difficult conversations are where real growth and trust are forged.

                THE BRAVE FRAMEWORK

                B — Begin with shared ground. "We both want this project to succeed" or "I value our relationship, which is why I want to address this."

                R — Reality check. State facts objectively. "The report was submitted 3 days late" not "You clearly don't care about deadlines." Separate behavior from the person.

                A — Acknowledge their perspective. "I understand you were dealing with competing priorities." This isn't agreement — it's respect.

                V — Voice your needs clearly. Use "I" statements: "I need reliable deadlines to plan my work" not "You always miss deadlines."

                E — Explore solutions together. "What can we put in place to prevent this?" Make it collaborative, not punitive.

                MANAGING EMOTIONS

                If you feel flooded, say "I need a moment" and take 3 deep breaths. If they get emotional, acknowledge it: "I can see this is important to you." Never say "Calm down." Stay curious, not furious.

                THE REPAIR CONVERSATION

                If a conversation goes badly, it's never too late: "I want to revisit our conversation. I don't think I communicated as well as I could have. Can we try again?"
                """,
                exercise: Exercise(
                    title: "Difficult Conversation Planner",
                    instructions: "Identify a difficult conversation you've been avoiding. Plan it using BRAVE: shared ground, facts, acknowledgment, needs, solutions.",
                    challenge: "Have the conversation. Afterward, journal what went well and what you'd do differently."
                ),
                keyTakeaways: [
                    "Start with shared ground to lower defenses",
                    "Separate behavior from the person",
                    "Use \"I\" statements for your needs",
                    "It's never too late to repair a conversation",
                ]
            ),
            DayLesson(
                day: 13,
                title: "The Feedback Loop",
                icon: "\u{1F501}",
                duration: "13 min",
                lesson: """
                Feedback is a gift — but most people either wrap it in so much padding it loses impact, or deliver it so bluntly it causes damage.

                GIVING FEEDBACK — THE SBI MODEL

                S — Situation: "During yesterday's client call..."
                B — Behavior: "...you interrupted the client three times while they were explaining their concerns..."
                I — Impact: "...which made them visibly frustrated and they cut the meeting short."

                Then add: "How can we approach this differently next time?"

                THE FEEDBACK RATIO

                Research suggests roughly 5 positive observations for every 1 critical one. This doesn't mean sandwiching criticism. It means building consistent positive recognition so critical feedback is received in a context of trust.

                RECEIVING FEEDBACK

                Listen fully before responding. Don't defend. Ask clarifying questions. Thank them — it took courage to share. Take 24 hours before deciding what to do with it. Look for the 2% truth — even in poorly delivered feedback, there's usually a kernel worth examining.

                ASKING FOR FEEDBACK PROACTIVELY

                Don't wait. Ask: "What's one thing I could do differently to be more effective?" This signals maturity and accelerates growth.
                """,
                exercise: Exercise(
                    title: "Feedback Practice",
                    instructions: "Give SBI feedback to one person today. Then ask one person: \"What's one thing I could improve about how I communicate in meetings?\"",
                    challenge: "Ask 3 different people for honest feedback about your communication. Compare responses — patterns reveal truth."
                ),
                keyTakeaways: [
                    "Use SBI: Situation, Behavior, Impact",
                    "Build trust with consistent positive recognition",
                    "When receiving feedback — listen first, react later",
                    "Proactively ask for feedback to accelerate growth",
                ]
            ),
            DayLesson(
                day: 14,
                title: "Week 2 Integration & Practice",
                icon: "\u{1F504}",
                duration: "16 min",
                lesson: """
                You now have a professional communication toolkit that most people spend decades assembling.

                YOUR WEEK 2 TOOLKIT

                CLEAR framework for written communication
                PEP method for speaking in meetings
                3-Act Structure for presentations
                WIN framework for negotiations
                BRAVE framework for difficult conversations
                SBI model for giving feedback

                INTEGRATION SCENARIO

                You receive an email from a frustrated client. Their latest shipment was delayed and they're threatening to switch providers.

                1. Draft a CLEAR email response acknowledging the issue
                2. Prepare PEP talking points for a follow-up call
                3. Build a BRAVE framework for the difficult conversation
                4. Use WIN principles to negotiate a resolution
                5. After resolution, deliver SBI feedback to your logistics team

                THE REPETITION PRINCIPLE

                Skills feel awkward at first. That's not failure — it's growth. Frameworks feel mechanical for the first 10-15 uses. Then they become second nature. Push through the awkward phase.
                """,
                exercise: Exercise(
                    title: "Full Scenario Drill",
                    instructions: "Walk through the angry client scenario step by step. Write the email. Script the call. Prepare the difficult conversation. Draft the feedback.",
                    challenge: "Rate yourself 1-10 on all 6 professional skills. Practice your weakest 3 times this weekend."
                ),
                keyTakeaways: [
                    "Frameworks feel mechanical at first — keep practicing",
                    "The gap between self-perception and peer perception reveals growth areas",
                    "Elite communicators have a system for every situation",
                    "Repetition transforms knowledge into instinct",
                ]
            ),
        ]
    )
}
