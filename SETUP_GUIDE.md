# 🏥 Manoसाथी Setup & Deployment Guide

## Quick Start

### Step 1: Install Dependencies
```bash
cd /path/to/manosaathi
flutter pub get
```

### Step 2: Run the App
```bash
flutter run
```

The app will start with the splash screen showing the animated **Manoसाथी** logo.

---

## 📁 Project Structure Overview

```
lib/
├── main.dart                              # App entry & routing
│
├── models/app_models.dart                 # Data structures
│   ├── User
│   ├── MoodEntry
│   ├── ChatMessage
│   ├── Assessment
│   └── HealthResource
│
├── controllers/app_controllers.dart       # Business logic
│   ├── UserController                    # Auth & profile
│   ├── ChatController                    # Chatbot & emotion detection
│   ├── MoodController                    # Mood tracking
│   └── AssessmentController              # PHQ-9 & GAD-7
│
├── views/screens/
│   ├── splash_screen.dart                # Animated splash (5s)
│   ├── home_screen.dart                  # Main dashboard
│   ├── chatbot_screen.dart               # AI conversation
│   └── other_screens.dart                # All other screens
│       ├── MoodCheckScreen
│       ├── AssessmentsScreen
│       ├── PHQ9Screen
│       ├── AudioScreen
│       ├── VideosScreen
│       ├── MoodHistoryScreen
│       ├── ProfileScreen
│       └── ResourcesScreen
│
├── widgets/custom_widgets.dart           # Reusable components
│   ├── CustomAppBar
│   ├── QuickActionCard
│   ├── ModuleCard
│   ├── ChatBubble
│   ├── MoodSelector
│   └── CrisisAlert
│
└── themes/app_theme.dart                 # Design system
    ├── AppColors (Red, White, Blue)
    └── AppTheme (Material 3 theme)
```

---

## 🎨 UI/UX Features

### Color Scheme (Healthcare Professional)
- **Primary**: Red (#E63946) - Healthcare, urgency, care
- **Secondary**: Dark Blue (#1D3557) - Trust, calm, stability
- **Accent**: Light Blue (#457B9D) - Support, healing
- **White**: Cleanliness, clarity
- **Grays**: Hierarchy, readability

### Key UI Components

#### 1. **Splash Screen** ✨
- Animated 5-second welcome
- Brain + Heart icon combo
- Gradient background
- Skip button for fast users
- Smooth fade-in animations

#### 2. **Home Dashboard** 🏠
- Personalized greeting
- 3 Quick Action Cards:
  - Talk Now (Chatbot)
  - Check Mood (Tracker)
  - Crisis Help (Emergency)
- 4 Module Cards:
  - Self-Assessment (PHQ-9/GAD-7)
  - Healing Audio
  - Videos
  - Mood History
- Bottom navigation with 4 tabs

#### 3. **Chatbot Screen** 💬
- Real-time message display
- Emotion detection badges
- Stress score visualization
- Voice input ready
- Crisis detection with alerts
- Empathetic AI responses

#### 4. **Mood Tracking** 😊
- 5 emoji mood selector (Excellent → Terrible)
- Optional notes field
- Instant save & feedback
- Stress level auto-calculation

#### 5. **Self-Assessments** 📋
- PHQ-9 (Depression screening)
- GAD-7 (Anxiety screening)
- Interactive scoring UI
- Instant results with interpretation

#### 6. **Crisis Alert** 🚨
- High-priority red styling
- Quick action buttons:
  - Call Helpline
  - Emergency Contact
  - Message Support
- Modal dialog design

---

## 🤖 AI & Detection Features

### Emotion Recognition
Analyzes chat input to detect:
- **Anxious**: Keywords: worry, anxious, nervous
- **Sad**: Keywords: sad, depressed, unhappy
- **Angry**: Keywords: angry, frustrated
- **Lonely**: Keywords: alone, lonely
- **Neutral**: Default

### Stress Score Calculation (0-100)
```
Base: 40
+ Long message (>100 chars): +10
+ Negative words ("not", "but"): +5
- Help-seeking language: -10
Range: 0-100 (clamped)
```

### Crisis Detection
Triggers emergency flow if message contains:
- "die", "suicide", "kill myself"
- "harm", "hurt myself"
- "no point", "end it all"

### Empathetic Response System
Bot adapts tone based on emotion:

```
Anxious:    "That sounds stressful. Try breathing exercise?"
Sad:        "You're not alone. Try a short activity?"
Angry:      "Valid frustration. Let's talk through it?"
Lonely:     "Thank you for sharing. Let's work together?"
Neutral:    "I'm here to listen. What's on your mind?"
```

---

## 📊 Screens & Navigation

### Screen Flow Diagram
```
Splash (5s)
    ↓
Onboarding (Privacy + Language)
    ↓
Auth (OTP/Email/Guest)
    ↓
Home Dashboard
    ├── Talk Now → Chatbot
    ├── Check Mood → Mood Entry
    ├── Crisis Help → Emergency Dialog
    ├── Self-Assessment → PHQ-9/GAD-7
    ├── Audio → Audio Library
    ├── Videos → Video Collection
    ├── Mood History → Trends
    └── Profile → Settings
```

### Bottom Navigation Tabs
1. **Home** - Main dashboard
2. **Assessments** - PHQ-9 & GAD-7
3. **Library** - Audio & videos
4. **Settings** - Profile & preferences

---

## 🔧 Customization Guide

### Change Theme Colors
Edit `lib/themes/app_theme.dart`:

```dart
// AppColors class
static const Color primary = Color(0xFFE63946); // Change red to blue
static const Color accent = Color(0xFF1D3557);  // Change blue
```

### Add New Assessment
Edit `lib/controllers/app_controllers.dart`:

```dart
Future<Assessment> completeWHOQOL(List<int> responses) async {
  int score = responses.fold(0, (sum, val) => sum + val);
  // Scoring logic...
}
```

### Modify Chatbot Responses
Edit `_generateBotResponse()` in `ChatController`:

```dart
String _generateBotResponse(String userMessage) {
  final sentiment = _detectSentiment(userMessage);
  
  final responses = {
    'anxious': 'Your custom response here',
    'sad': 'Your custom response here',
    // ...
  };
  
  return responses[sentiment] ?? 'Default response';
}
```

### Add New Audio/Video Resources
Extend `HealthResource` model with:

```dart
List<HealthResource> audioLibrary = [
  HealthResource(
    id: '1',
    title: '432Hz Healing',
    category: 'Binaural Beats',
    description: 'Frequency healing sound',
    duration: 600,
    audioUrl: 'https://...',
  ),
];
```

---

## 🚀 Deployment

### Android Build
```bash
flutter build apk --release
# Output: build/app/outputs/flutter-app.apk
```

### iOS Build
```bash
flutter build ios --release
# Use Xcode to sign and upload to App Store
```

### Web Build
```bash
flutter build web --release
# Output: build/web/
```

---

## 🔐 Security Checklist

- [ ] Enable app signing
- [ ] Configure Firebase for production
- [ ] Enable data encryption
- [ ] Set up secure API endpoints
- [ ] Configure privacy policy
- [ ] Set up terms of service
- [ ] Enable crash reporting (Firebase Crashlytics)
- [ ] Implement rate limiting for API
- [ ] Add HIPAA compliance (if required)
- [ ] Configure backup settings

---

## 📱 Testing Checklist

### Functional Testing
- [ ] Splash screen animation
- [ ] Navigation between all screens
- [ ] Chatbot message sending/receiving
- [ ] Mood entry save
- [ ] PHQ-9 assessment completion
- [ ] Crisis alert trigger
- [ ] Emergency contact functionality

### UI/UX Testing
- [ ] Color contrast accessibility
- [ ] Text size readability
- [ ] Button responsiveness
- [ ] Keyboard handling
- [ ] Landscape orientation support
- [ ] Dark mode support

### Performance Testing
- [ ] App startup time < 2s
- [ ] Chatbot response time < 1s
- [ ] No memory leaks
- [ ] Smooth animations (60 fps)

### Device Testing
- [ ] Android 8+ (minimum)
- [ ] iOS 12+ (minimum)
- [ ] Various screen sizes
- [ ] Tablet compatibility

---

## 📦 Deployment Credentials

### Firebase Setup
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login
firebase login

# Initialize
firebase init
```

### Environment Variables
Create `.env` file:
```
API_BASE_URL=https://api.manosaathi.app
FIREBASE_PROJECT=manosaathi-prod
ANALYTICS_KEY=xxxx
```

---

## 🐛 Troubleshooting

### App crashes on startup
- Clear build: `flutter clean`
- Rebuild: `flutter pub get && flutter run`
- Check Android SDK version

### Chatbot not responding
- Check internet connection
- Verify API endpoint in controller
- Check chat message length > 0

### Theme not applying
- Restart app with `flutter run -v`
- Check `AppTheme.lightTheme` configuration
- Verify Material 3 support

### Orientation issues
- Add to `AndroidManifest.xml`:
  ```xml
  android:screenOrientation="portrait"
  ```

---

## 📈 Analytics & Monitoring

### Events to Track
```dart
// Chat interaction
logEvent('chat_message_sent', {
  'sentiment': message.sentiment,
  'stress_score': message.stressScore,
  'duration': responseDuration,
});

// Mood entry
logEvent('mood_entry', {
  'score': moodEntry.moodScore,
  'stress_level': moodEntry.stressLevel,
});

// Assessment completion
logEvent('assessment_completed', {
  'type': assessment.type,
  'score': assessment.score,
  'interpretation': assessment.interpretation,
});
```

### Metrics to Monitor
- Daily active users (DAU)
- Monthly active users (MAU)
- Average session duration
- Crash rate
- API response time
- Emotion distribution

---

## 📞 Support

For issues or questions:
1. Check `ARCHITECTURE.md` for design patterns
2. Review controller implementations
3. Check Flutter documentation
4. Open GitHub issue with detailed logs

---

**Built with care for mental wellness** 🧠❤️
