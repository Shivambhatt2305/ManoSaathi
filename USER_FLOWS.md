# 📊 Manoसाथी - Complete User Flow & Flowchart

## System Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────┐
│                         Manoसाथी App                             │
├─────────────────────────────────────────────────────────────────┤
│                                                                   │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │              PRESENTATION LAYER (Views)                   │  │
│  ├───────────────────────────────────────────────────────────┤  │
│  │  • Splash Screen                                          │  │
│  │  • Home Dashboard (Quick Actions + Modules)              │  │
│  │  • Chatbot Screen                                         │  │
│  │  • Mood Check Screen                                      │  │
│  │  • Assessment Screens (PHQ-9, GAD-7)                     │  │
│  │  • Audio/Video Library                                    │  │
│  │  • Profile & Settings                                     │  │
│  └───────────────────────────────────────────────────────────┘  │
│                             ↓                                     │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │            BUSINESS LOGIC LAYER (Controllers)            │  │
│  ├───────────────────────────────────────────────────────────┤  │
│  │  • UserController (Auth, Profile)                        │  │
│  │  • ChatController (Emotion Detection, Crisis Check)      │  │
│  │  • MoodController (Tracking, Stats)                      │  │
│  │  • AssessmentController (PHQ-9, GAD-7 Scoring)          │  │
│  └───────────────────────────────────────────────────────────┘  │
│                             ↓                                     │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │              DATA LAYER (Models)                          │  │
│  ├───────────────────────────────────────────────────────────┤  │
│  │  • User Model                                             │  │
│  │  • MoodEntry Model                                        │  │
│  │  • ChatMessage Model                                      │  │
│  │  • Assessment Model                                       │  │
│  │  • HealthResource Model                                   │  │
│  └───────────────────────────────────────────────────────────┘  │
│                             ↓                                     │
│  ┌───────────────────────────────────────────────────────────┐  │
│  │        BACKEND / DATA STORAGE LAYER (Ready for API)      │  │
│  ├───────────────────────────────────────────────────────────┤  │
│  │  • Firebase / REST API                                    │  │
│  │  • Local SQLite / Hive                                    │  │
│  │  • Cloud Storage (Audio/Video)                            │  │
│  └───────────────────────────────────────────────────────────┘  │
│                                                                   │
└─────────────────────────────────────────────────────────────────┘
```

---

## 🎯 Complete User Journey Flowchart

```
                           START
                             │
                             ▼
                    ┌─────────────────┐
                    │ Splash Screen   │
                    │   (Animated)    │
                    │  5 seconds      │
                    └────────┬────────┘
                             │
                      ┌──────┴──────┐
                      ▼             ▼
                   SKIP         WAIT (5s)
                    │             │
                    └──────┬──────┘
                           ▼
              ┌────────────────────────────┐
              │   Onboarding (3 Screens)   │
              ├────────────────────────────┤
              │ Screen 1: Welcome + Mission│
              │ Screen 2: Privacy Consent  │
              │ Screen 3: Language Select  │
              └────────┬───────────────────┘
                       │
              (Consent Required)
                       │
                       ▼
              ┌────────────────────────────┐
              │  Authentication Screen     │
              ├────────────────────────────┤
              │ ├─ Phone OTP               │
              │ ├─ Email                   │
              │ └─ Continue as Guest       │
              └────────┬───────────────────┘
                       │
                       ▼
              ┌────────────────────────────┐
              │  Set Emergency Contacts    │
              │      (Optional)            │
              └────────┬───────────────────┘
                       │
                       ▼
         ╔═════════════════════════════════════╗
         ║      HOME DASHBOARD (Main Hub)      ║
         ║                                     ║
         ║  ┌──────────────────────────────┐  ║
         ║  │    Today's Status Card       │  ║
         ║  │    Mood: 😊 Feeling Good    │  ║
         ║  └──────────────────────────────┘  ║
         ║                                     ║
         ║  ┌─ QUICK ACTIONS (3 Cards) ────┐  ║
         ║  │                                │  ║
         ║  │  [Talk Now]  [Check Mood]  │  ║
         ║  │  [Crisis Help]            │  ║
         ║  │                                │  ║
         ║  └────────────────────────────────┘  ║
         ║                                     ║
         ║  ┌─ EXPLORE RESOURCES ───────────┐  ║
         ║  │  [Self-Assessment]             │  ║
         ║  │  [Healing Audio]               │  ║
         ║  │  [Videos]                      │  ║
         ║  │  [Mood History]                │  ║
         ║  └────────────────────────────────┘  ║
         ║                                     ║
         ║  Bottom Nav: Home | Assessment |   ║
         ║             Library | Settings    ║
         ╚═════════════════════════════════════╝
                       │
       ┌───────────────┼───────────────┬─────────────────┬─────────┐
       │               │               │                 │         │
       ▼               ▼               ▼                 ▼         ▼
    TALK NOW     CHECK MOOD     CRISIS HELP      ASSESSMENTS   AUDIO
       │               │               │                 │         │
       ├─────┐         ├─────┐         │                 │         │
       │     │         │     │         │                 │         │
       ▼     ▼         ▼     ▼         ▼                 ▼         ▼
   PRE-CHAT  │   EMOJI      │    EMERGENCY      PHQ-9   AUDIO CAT.
   SAFETY    │   SELECTOR   │    DIALOG        SCREEN   LIBRARY
             │              │                             │
      (Auto) │          NOTES INPUT               QUESTIONS 1-9
             │              │                      (9 items)
             │              ▼                             │
             │          SAVE ENTRY                SCORE CALCULATION
             │              │                             │
             └─────┬────────┘                             ▼
                   ▼                                   RESULTS
              CHATBOT SCREEN                          ├─ Score
              ├─ Chat History                         ├─ Interp.
              ├─ Emotion Detection                    └─ Follow-up
              ├─ Stress Score
              └─ Message Input (Text/Voice)

CHATBOT LOGIC FLOW:
    │
    ├─ Input: User Message
    │   ↓
    ├─ Emotion Analyzer
    │   ├─→ Detect: sad/anxious/angry/lonely/neutral
    │   └─→ Calculate Stress Score (0-100)
    │
    ├─ Crisis Detector
    │   ├─→ Check for: suicide, self-harm, hopeless
    │   └─→ YES? → Show CRISIS ALERT
    │
    ├─ Response Generator
    │   ├─ Empathetic for anxiety
    │   ├─ Validating for depression
    │   ├─ Motivational for low mood
    │   └─ Connecting for loneliness
    │
    ├─ Action Suggester
    │   ├─ Breathing exercise
    │   ├─ Audio track
    │   ├─ Grounding technique
    │   └─ Schedule reminder
    │
    └─ Crisis Response (if triggered)
       ├─ Show Crisis Alert Dialog
       ├─ Offer: [Call Helpline] [Emergency Contact]
       └─ Log Session for Review

CRISIS ALERT FLOW:
    │
    ├─ Immediate: Show RED Alert
    │   ├─ Warning Icon
    │   ├─ Empathetic Message
    │   └─ 2 CTA Buttons
    │
    ├─ [Call Helpline]
    │   └─→ Dial: 1800-273-8255
    │
    └─ [Emergency Contact]
        └─→ Send SMS + Notify Contact
```

---

## 📱 Screen Navigation Tree

```
SplashScreen
├─ Skip Button → OnboardingScreen
└─ Auto (5s) → OnboardingScreen
             ├─ Screen 1: Welcome
             ├─ Screen 2: Privacy
             ├─ Screen 3: Language
             └─ Button: Continue → AuthScreen
                       ├─ Phone OTP
                       ├─ Email
                       └─ Guest Mode
                         └─ HomeScreen (Main Hub)

HomeScreen (Main Hub)
├─ Bottom Nav: Home
│  └─ (Already here)
│
├─ Bottom Nav: Assessments
│  └─ AssessmentsScreen
│     ├─ Card: PHQ-9
│     │  └─ PHQ9Screen (9 questions)
│     │     └─ Result Dialog
│     └─ Card: GAD-7 (Coming Soon)
│
├─ Bottom Nav: Library
│  └─ AudioScreen
│     ├─ Binaural Beats (432Hz, 528Hz)
│     ├─ Guided Meditation (5, 10, 20 min)
│     └─ Sleep Frequencies (Delta, Theta)
│
├─ Bottom Nav: Settings
│  └─ ProfileScreen
│     ├─ Edit Profile
│     ├─ Language
│     ├─ Emergency Contacts
│     ├─ Privacy
│     └─ Logout
│
├─ Quick Action: Talk Now
│  └─ ChatbotScreen
│     ├─ Pre-chat Check
│     ├─ Chat Bubble List
│     ├─ Message Input
│     └─ Crisis Detection
│        └─ CrisisAlert Dialog
│
├─ Quick Action: Check Mood
│  └─ MoodCheckScreen
│     ├─ Emoji Selector (5 moods)
│     ├─ Notes Input
│     └─ Save Button
│
├─ Quick Action: Crisis Help
│  └─ CrisisAlert Dialog
│     ├─ [Call Helpline]
│     ├─ [Text Support]
│     └─ [Emergency Contact]
│
├─ Module: Self-Assessment
│  └─ AssessmentsScreen (see above)
│
├─ Module: Healing Audio
│  └─ AudioScreen (see above)
│
├─ Module: Videos
│  └─ VideosScreen
│     ├─ Quick Breathing (2:30)
│     ├─ CBT for Anxiety (8:45)
│     └─ Motivation Boost (5:10)
│
└─ Module: Mood History
   └─ MoodHistoryScreen
      ├─ Chart (7-day trend)
      ├─ Statistics
      └─ Export Option

```

---

## 🔄 Data Flow Diagram

```
USER INPUT
    │
    ├─────────┐
    │         │
    ▼         ▼
[Chat]    [Mood]
    │         │
    ├────┬────┤
    │    │    │
    ▼    ▼    ▼
Controller → Model → Validation
    │         │          │
    ├─────────┴──────────┤
    │                    │
    ▼                    ▼
Process Logic      Save to Storage
    │                    │
    ├─ Emotion Detection ├─ Local JSON
    ├─ Stress Calc    ├─ SQLite
    ├─ Crisis Check   └─ API Sync
    └─ Response Gen
    │
    ├─────────────────────────────┐
    │                             │
    ▼                             ▼
Update View               Log Analytics
    │                             │
    ├─ Refresh Chat List   ├─ User Behavior
    ├─ Show Result         ├─ Feature Usage
    └─ Navigate            └─ Error Tracking
```

---

## 🎯 User Journey Examples

### Journey 1: Distressed User (Fast Path)

```
1. Opens app at 11 PM (stressed, can't sleep)
   │
2. Splash screen plays (auto-skip available)
   │
3. Lands on Home Dashboard
   │
4. Taps "Talk Now" (no typing needed)
   │
5. Sees Pre-Chat Safety Check
   "Are you safe right now?"
   ├─ YES → Proceed to chatbot
   └─ NO → Show crisis helpline
   │
6. Chatbot opens, greets user
   "Hi, I'm here to support. What's troubling you?"
   │
7. User types: "Can't sleep, too much worry"
   │
8. Bot analyzes:
   ├─ Emotion: ANXIOUS (detected)
   ├─ Stress: 67/100
   └─ No crisis keywords
   │
9. Bot responds empathetically:
   "I hear you. Anxiety can really disrupt sleep.
    Let's try a 2-minute breathing exercise?
    I can also play a calming audio track."
   │
10. User: "Yes, please help"
    │
11. Bot offers:
    ├─ Breathing guide (animated)
    ├─ Sleep frequency audio (link)
    └─ Journal prompt for worries
    │
12. User feels calmer after 5 min
    │
13. Session logged:
    ├─ Emotion: anxious
    ├─ Stress: 67 → 42 (improved)
    ├─ Duration: 5 min
    └─ Intervention: Breathing + Audio
    │
14. Bot: "Better? Remember, I'm here 24/7."
    │
15. User closes app, sleeps better ✓
```

### Journey 2: Routine User (Daily Check-In)

```
1. Opens app (morning)
   │
2. Home Dashboard loads
   │
3. Sees "Today's Status" card
   "Check your mood daily!"
   │
4. Taps "Check Mood"
   │
5. Selects emoji: 😐 (Okay)
   │
6. Optional notes: "Slept well, but work is stressful"
   │
7. Taps "Save Mood Entry"
   │
8. Instant feedback:
   ├─ "Mood recorded!"
   ├─ Stress level: MEDIUM
   └─ Suggestion: "Try 5-min meditation?"
   │
9. Taps "Yes, let's meditate"
   │
10. AudioScreen opens
    ├─ [Guided Meditation - 5 min]
    └─ Play button
    │
11. After meditation:
    ├─ Mood updates to: 😊
    ├─ Stress: MEDIUM → LOW
    └─ Stats show: "+3 improved from yesterday"
    │
12. User feels better, goes to work ✓
```

### Journey 3: Assessment-Focused User

```
1. Opens app (concerned about mental health)
   │
2. Home Dashboard
   │
3. Bottom nav: "Assessment"
   │
4. AssessmentsScreen shows:
   ├─ PHQ-9 card
   ├─ GAD-7 card
   └─ History (empty)
   │
5. Taps "PHQ-9 - Depression Screening"
   │
6. PHQ9Screen loads
   "Over the last two weeks..."
   │
7. 9 questions presented:
   1. "Little interest in doing things" → Selects: 2 (Several days)
   2. "Feeling down, depressed" → Selects: 2
   ... (7 more questions)
   │
8. Submits assessment
   │
9. Results Dialog appears:
   ├─ Score: 14
   ├─ Interpretation: MODERATE DEPRESSION
   └─ Next Steps:
       ├─ "Consider speaking with counselor"
       ├─ "Try our CBT video series"
       └─ "Daily mood tracking can help"
   │
10. User reads about next steps
    │
11. Taps "Watch CBT Video"
    │
12. VideoScreen opens, plays 8-min CBT lesson
    │
13. User feels empowered with action plan ✓
```

---

## 🔐 Security & Privacy Flow

```
User Data Collection
    │
    ├─ INPUT: Chat message
    │  │
    │  ├─ Check: Contains PII? (Name, Email, Phone)
    │  │  │
    │  │  └─ IF YES → Hash/Encrypt or Discard
    │  │
    │  ├─ Check: User consented to storage?
    │  │  │
    │  │  └─ IF NO → Don't save, only process
    │  │
    │  └─ Process for emotion/stress/crisis
    │
    ├─ OUTPUT: Store securely
    │  │
    │  ├─ Encrypt at rest
    │  ├─ Encrypt in transit (HTTPS)
    │  └─ Anonymize for analytics
    │
    └─ USER CONTROL:
       ├─ View: All my data
       ├─ Export: Download as JSON
       ├─ Delete: Purge account
       └─ Revoke: Stop data collection
```

---

## 📊 Key Metrics Dashboard

```
Daily Active Users
├─ Last 7 days: 1,234 users
├─ Last 30 days: 5,678 users
└─ Retention: 42% (Day 7)

Feature Usage
├─ Chatbot: 65% of users
├─ Mood Check: 45% of users
├─ Assessments: 15% of users
└─ Audio: 30% of users

Emotion Distribution
├─ Anxious: 35%
├─ Sad: 25%
├─ Neutral: 20%
├─ Angry: 12%
└─ Lonely: 8%

Crisis Events
├─ This month: 12 detections
├─ Response rate: 92%
└─ Escalation success: 85%

Average Stress Score
├─ Pre-intervention: 68/100
└─ Post-intervention: 42/100 (↓38%)
```

---

## 🚀 Next Version Features (V2.0)

```
Priority 1 (High Impact)
├─ Voice input/output
├─ Long-term mood trends & charts
├─ Clinician export feature
└─ Multi-language support

Priority 2 (Medium)
├─ Offline mode
├─ Push notifications
├─ Community features
└─ Family/friend sharing

Priority 3 (Nice-to-have)
├─ Wearable integration
├─ Video counseling
├─ Medication tracking
└─ Advanced NLP insights
```

---

**Designed for accessibility, privacy, and emotional support** 🧠❤️✨
