// Import statements for models
import '../models/app_models.dart';

// User Controller - handles authentication and user data
class UserController {
  static final UserController _instance = UserController._internal();

  factory UserController() {
    return _instance;
  }

  UserController._internal();

  // Simulate user authentication
  Future<bool> loginWithOTP(String phone) async {
    // Simulated API call
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> loginWithEmail(String email) async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }

  Future<bool> continueAsGuest() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  Future<bool> logout() async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  // Update user profile
  Future<bool> updateUserProfile({
    String? name,
    String? language,
    List<String>? emergencyContacts,
  }) async {
    await Future.delayed(const Duration(seconds: 1));
    return true;
  }

  // Save consent
  Future<bool> saveDataConsent(bool consent) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }
}

// Chat Controller - handles chatbot interactions
class ChatController {
  static final ChatController _instance = ChatController._internal();

  factory ChatController() {
    return _instance;
  }

  ChatController._internal();

  List<ChatMessage> messages = [];

  // Send message and get AI response
  Future<ChatMessage> sendMessage(String userMessage) async {
    // Add user message
    final userMsg = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: userMessage,
      timestamp: DateTime.now(),
      isUser: true,
    );
    messages.add(userMsg);

    // Simulate emotion detection and response generation
    await Future.delayed(const Duration(milliseconds: 800));

    // Simulated bot response based on user input
    String botResponse = _generateBotResponse(userMessage);

    final botMsg = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      content: botResponse,
      timestamp: DateTime.now(),
      isUser: false,
      sentiment: _detectSentiment(userMessage),
      stressScore: _calculateStressScore(userMessage),
    );
    messages.add(botMsg);

    return botMsg;
  }

  // Detect emotion from text
  String _detectSentiment(String text) {
    text = text.toLowerCase();
    if (text.contains('worry') ||
        text.contains('anxious') ||
        text.contains('nervous')) {
      return 'anxious';
    } else if (text.contains('sad') ||
        text.contains('depressed') ||
        text.contains('unhappy')) {
      return 'sad';
    } else if (text.contains('angry') || text.contains('frustrated')) {
      return 'angry';
    } else if (text.contains('alone') || text.contains('lonely')) {
      return 'lonely';
    }
    return 'neutral';
  }

  // Calculate stress score
  double _calculateStressScore(String text) {
    // Simulated stress calculation (0-100)
    double score = 40.0;
    if (text.length > 100) score += 10;
    if (text.contains('not')) score += 5;
    if (text.contains('help') || text.contains('support')) score -= 10;
    return (score).clamp(0, 100).toDouble();
  }

  // Generate empathetic bot response
  String _generateBotResponse(String userMessage) {
    final sentiment = _detectSentiment(userMessage);

    final responses = {
      'anxious':
          'I hear you — that sounds really stressful. Would you like to try a 2-minute breathing exercise with me now? It often helps calm anxiety.',
      'sad':
          'I\'m sorry you\'re feeling this way. You\'re not alone here. Would you like to talk about what\'s been happening, or try a short activity to lift your mood?',
      'angry':
          'I can sense your frustration. That\'s valid. Would you like to talk about what triggered these feelings, or try a calming exercise?',
      'lonely':
          'Loneliness can be really tough. Thank you for sharing. Let\'s work through this together. What would help you feel more connected right now?',
      'neutral':
          'Thank you for sharing. I\'m here to listen and support you. What\'s on your mind today?',
    };

    return responses[sentiment] ?? responses['neutral']!;
  }

  // Clear chat history
  void clearHistory() {
    messages.clear();
  }

  // Get crisis detection
  bool detectCrisis(String text) {
    final crisisKeywords = [
      'die',
      'suicide',
      'kill myself',
      'harm',
      'hurt myself',
      'no point',
      'end it all',
    ];
    text = text.toLowerCase();
    return crisisKeywords.any((keyword) => text.contains(keyword));
  }
}

// Mood Controller
class MoodController {
  static final MoodController _instance = MoodController._internal();

  factory MoodController() {
    return _instance;
  }

  MoodController._internal();

  List<MoodEntry> moodHistory = [];

  // Record mood
  Future<bool> recordMood({
    required int score,
    required String emoji,
    String? notes,
    String? stressLevel,
  }) async {
    final mood = MoodEntry(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      timestamp: DateTime.now(),
      moodScore: score,
      moodEmoji: emoji,
      notes: notes,
      stressLevel: stressLevel,
    );
    moodHistory.add(mood);
    await Future.delayed(const Duration(milliseconds: 500));
    return true;
  }

  // Get mood statistics
  Map<String, dynamic> getMoodStats(int days) {
    final now = DateTime.now();
    final pastDate = now.subtract(Duration(days: days));

    final recentMoods = moodHistory
        .where((mood) => mood.timestamp.isAfter(pastDate))
        .toList();

    if (recentMoods.isEmpty) {
      return {'average': 5.0, 'trend': 'stable', 'count': 0};
    }

    double average =
        recentMoods.fold(0, (sum, mood) => sum + mood.moodScore) /
        recentMoods.length;

    return {
      'average': average,
      'trend': average > 6.5 ? 'improving' : 'declining',
      'count': recentMoods.length,
      'entries': recentMoods,
    };
  }
}

// Assessment Controller
class AssessmentController {
  static final AssessmentController _instance =
      AssessmentController._internal();

  factory AssessmentController() {
    return _instance;
  }

  AssessmentController._internal();

  List<Assessment> assessments = [];

  // PHQ-9 Assessment
  Future<Assessment> completePHQ9(List<int> responses) async {
    int score = responses.fold(0, (sum, val) => sum + val);

    String interpretation;
    if (score < 5) {
      interpretation = 'Minimal';
    } else if (score < 10) {
      interpretation = 'Mild';
    } else if (score < 15) {
      interpretation = 'Moderate';
    } else if (score < 20) {
      interpretation = 'Moderately Severe';
    } else {
      interpretation = 'Severe';
    }

    final assessment = Assessment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: 'PHQ-9',
      responses: responses,
      score: score,
      interpretation: interpretation,
      timestamp: DateTime.now(),
    );

    assessments.add(assessment);
    await Future.delayed(const Duration(milliseconds: 500));
    return assessment;
  }

  // GAD-7 Assessment
  Future<Assessment> completeGAD7(List<int> responses) async {
    int score = responses.fold(0, (sum, val) => sum + val);

    String interpretation;
    if (score < 5) {
      interpretation = 'Minimal';
    } else if (score < 10) {
      interpretation = 'Mild';
    } else if (score < 15) {
      interpretation = 'Moderate';
    } else if (score < 21) {
      interpretation = 'Severe';
    } else {
      interpretation = 'Severe';
    }

    final assessment = Assessment(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      type: 'GAD-7',
      responses: responses,
      score: score,
      interpretation: interpretation,
      timestamp: DateTime.now(),
    );

    assessments.add(assessment);
    await Future.delayed(const Duration(milliseconds: 500));
    return assessment;
  }

  // Get assessment history
  List<Assessment> getAssessmentHistory() {
    return assessments;
  }
}
