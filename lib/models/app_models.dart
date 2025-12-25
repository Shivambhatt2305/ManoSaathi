// User Model for authentication and profile
class User {
  final String? id;
  final String? name;
  final String? email;
  final String? phone;
  final bool isGuest;
  final String? preferredLanguage;
  final List<String>? emergencyContacts;
  final bool? dataConsent;

  User({
    this.id,
    this.name,
    this.email,
    this.phone,
    this.isGuest = true,
    this.preferredLanguage = 'en',
    this.emergencyContacts,
    this.dataConsent = false,
  });

  // Convert User to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'isGuest': isGuest,
      'preferredLanguage': preferredLanguage,
      'emergencyContacts': emergencyContacts,
      'dataConsent': dataConsent,
    };
  }

  // Create User from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      isGuest: json['isGuest'] ?? true,
      preferredLanguage: json['preferredLanguage'] ?? 'en',
      emergencyContacts: List<String>.from(json['emergencyContacts'] ?? []),
      dataConsent: json['dataConsent'] ?? false,
    );
  }
}

// Mood Model
class MoodEntry {
  final String id;
  final DateTime timestamp;
  final int moodScore; // 1-10
  final String moodEmoji; // 😊, 😐, 😢, etc.
  final String? notes;
  final String? stressLevel; // Low, Medium, High

  MoodEntry({
    required this.id,
    required this.timestamp,
    required this.moodScore,
    required this.moodEmoji,
    this.notes,
    this.stressLevel,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'timestamp': timestamp.toIso8601String(),
      'moodScore': moodScore,
      'moodEmoji': moodEmoji,
      'notes': notes,
      'stressLevel': stressLevel,
    };
  }

  factory MoodEntry.fromJson(Map<String, dynamic> json) {
    return MoodEntry(
      id: json['id'],
      timestamp: DateTime.parse(json['timestamp']),
      moodScore: json['moodScore'],
      moodEmoji: json['moodEmoji'],
      notes: json['notes'],
      stressLevel: json['stressLevel'],
    );
  }
}

// Chat Message Model
class ChatMessage {
  final String id;
  final String content;
  final DateTime timestamp;
  final bool isUser;
  final String? sentiment; // sad, anxious, angry, lonely, neutral
  final double? stressScore; // 0-100
  final String? audioUrl;

  ChatMessage({
    required this.id,
    required this.content,
    required this.timestamp,
    required this.isUser,
    this.sentiment,
    this.stressScore,
    this.audioUrl,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'content': content,
      'timestamp': timestamp.toIso8601String(),
      'isUser': isUser,
      'sentiment': sentiment,
      'stressScore': stressScore,
      'audioUrl': audioUrl,
    };
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      content: json['content'],
      timestamp: DateTime.parse(json['timestamp']),
      isUser: json['isUser'],
      sentiment: json['sentiment'],
      stressScore: json['stressScore']?.toDouble(),
      audioUrl: json['audioUrl'],
    );
  }
}

// Assessment Model
class Assessment {
  final String id;
  final String type; // PHQ-9, GAD-7
  final List<int> responses;
  final int score;
  final String
  interpretation; // Minimal, Mild, Moderate, Moderately Severe, Severe
  final DateTime timestamp;

  Assessment({
    required this.id,
    required this.type,
    required this.responses,
    required this.score,
    required this.interpretation,
    required this.timestamp,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'type': type,
      'responses': responses,
      'score': score,
      'interpretation': interpretation,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory Assessment.fromJson(Map<String, dynamic> json) {
    return Assessment(
      id: json['id'],
      type: json['type'],
      responses: List<int>.from(json['responses']),
      score: json['score'],
      interpretation: json['interpretation'],
      timestamp: DateTime.parse(json['timestamp']),
    );
  }
}

// Audio/Video Resource Model
class HealthResource {
  final String id;
  final String title;
  final String category; // Binaural Beats, Meditation, Sleep, CBT, etc.
  final String description;
  final int duration; // in seconds
  final String? imageUrl;
  final String? audioUrl;
  final String? videoUrl;
  final double? rating;
  final bool isFavorite;
  final bool isDownloaded;

  HealthResource({
    required this.id,
    required this.title,
    required this.category,
    required this.description,
    required this.duration,
    this.imageUrl,
    this.audioUrl,
    this.videoUrl,
    this.rating,
    this.isFavorite = false,
    this.isDownloaded = false,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'category': category,
      'description': description,
      'duration': duration,
      'imageUrl': imageUrl,
      'audioUrl': audioUrl,
      'videoUrl': videoUrl,
      'rating': rating,
      'isFavorite': isFavorite,
      'isDownloaded': isDownloaded,
    };
  }

  factory HealthResource.fromJson(Map<String, dynamic> json) {
    return HealthResource(
      id: json['id'],
      title: json['title'],
      category: json['category'],
      description: json['description'],
      duration: json['duration'],
      imageUrl: json['imageUrl'],
      audioUrl: json['audioUrl'],
      videoUrl: json['videoUrl'],
      rating: json['rating']?.toDouble(),
      isFavorite: json['isFavorite'] ?? false,
      isDownloaded: json['isDownloaded'] ?? false,
    );
  }
}
