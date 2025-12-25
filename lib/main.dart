import 'package:flutter/material.dart';
import 'themes/app_theme.dart';
import 'views/screens/splash_screen.dart';
import 'views/screens/home_screen.dart';
import 'views/screens/chatbot_screen.dart';
import 'views/screens/other_screens.dart';
import 'views/screens/support_screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manoसाथी - Mental Health Support',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.light,
      home: const SplashScreen(),
      routes: {
        '/splash': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/chatbot': (context) => const ChatbotScreen(),
        '/onboarding': (context) => const HomeScreen(),
        '/talk': (context) => const ComingSoonScreen(),
        '/support': (context) => const SupportScreen(),
        '/mood-check': (context) => const MoodCheckScreen(),
        '/assessments': (context) => const AssessmentsScreen(),
        '/audio': (context) => const AudioScreen(),
        '/videos': (context) => const VideosScreen(),
        '/mood-history': (context) => const MoodHistoryScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/resources': (context) => const ResourcesScreen(),
      },
    );
  }
}
