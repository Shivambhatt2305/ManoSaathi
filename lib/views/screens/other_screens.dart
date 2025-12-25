import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';
import '../../widgets/custom_widgets.dart';
import '../../controllers/app_controllers.dart';

class MoodCheckScreen extends StatefulWidget {
  const MoodCheckScreen({Key? key}) : super(key: key);

  @override
  State<MoodCheckScreen> createState() => _MoodCheckScreenState();
}

class _MoodCheckScreenState extends State<MoodCheckScreen> {
  final MoodController _moodController = MoodController();
  int? _selectedMood;
  String? _selectedEmoji;
  TextEditingController? _notesController;

  @override
  void initState() {
    super.initState();
    _notesController = TextEditingController();
  }

  void _submitMood() async {
    if (_selectedMood == null) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please select a mood')));
      return;
    }

    final success = await _moodController.recordMood(
      score: _selectedMood!,
      emoji: _selectedEmoji ?? '😐',
      notes: _notesController?.text,
      stressLevel: _getStressLevel(_selectedMood!),
    );

    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Mood recorded successfully!')),
      );
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pop(context);
      });
    }
  }

  String _getStressLevel(int score) {
    if (score >= 8) return 'Low';
    if (score >= 5) return 'Medium';
    return 'High';
  }

  @override
  void dispose() {
    _notesController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Check Your Mood'),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.accentLight.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColors.accentLight.withOpacity(0.2),
                ),
              ),
              padding: const EdgeInsets.all(16),
              child: MoodSelector(
                onMoodSelected: (score, emoji) {
                  setState(() {
                    _selectedMood = score;
                    _selectedEmoji = emoji;
                  });
                },
              ),
            ),
            const SizedBox(height: 32),
            Text(
              'Additional Notes (Optional)',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: _notesController,
              decoration: InputDecoration(
                hintText: 'What\'s on your mind? Any triggers or events?',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                filled: true,
                fillColor: AppColors.white,
              ),
              maxLines: 4,
            ),
            const SizedBox(height: 28),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitMood,
                child: const Text('Save Mood Entry'),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AssessmentsScreen extends StatefulWidget {
  const AssessmentsScreen({Key? key}) : super(key: key);

  @override
  State<AssessmentsScreen> createState() => _AssessmentsScreenState();
}

class _AssessmentsScreenState extends State<AssessmentsScreen> {
  final AssessmentController _assessmentController = AssessmentController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Self-Assessments'),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Choose an Assessment',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            _buildAssessmentCard(
              title: 'PHQ-9',
              subtitle: 'Patient Health Questionnaire',
              description:
                  'A 9-item screening tool for depression. Takes about 2-3 minutes.',
              icon: Icons.health_and_safety,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PHQ9Screen()),
                );
              },
            ),
            const SizedBox(height: 12),
            _buildAssessmentCard(
              title: 'GAD-7',
              subtitle: 'Generalized Anxiety Disorder',
              description:
                  'A 7-item screening tool for anxiety. Takes about 2 minutes.',
              icon: Icons.favorite_border,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('GAD-7 coming soon')),
                );
              },
            ),
            const SizedBox(height: 32),
            Text(
              'Your Assessment History',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 12),
            if (_assessmentController.assessments.isEmpty)
              const Center(
                child: Text(
                  'No assessments completed yet',
                  style: TextStyle(color: AppColors.mediumGray),
                ),
              )
            else
              ..._assessmentController.assessments.map((assessment) {
                return Card(
                  child: ListTile(
                    title: Text(assessment.type),
                    subtitle: Text(assessment.interpretation),
                    trailing: Text(
                      'Score: ${assessment.score}',
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                );
              }),
          ],
        ),
      ),
    );
  }

  Widget _buildAssessmentCard({
    required String title,
    required String subtitle,
    required String description,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: [
                AppColors.primary.withOpacity(0.05),
                AppColors.accentLight.withOpacity(0.05),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, color: AppColors.primary, size: 32),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        Text(
                          subtitle,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: AppColors.mediumGray,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(description, style: Theme.of(context).textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }
}

class PHQ9Screen extends StatefulWidget {
  const PHQ9Screen({Key? key}) : super(key: key);

  @override
  State<PHQ9Screen> createState() => _PHQ9ScreenState();
}

class _PHQ9ScreenState extends State<PHQ9Screen> {
  final AssessmentController _assessmentController = AssessmentController();
  final List<int> _responses = List.filled(9, 0);

  final List<String> _questions = [
    'Little interest or pleasure in doing things',
    'Feeling down, depressed, or hopeless',
    'Trouble falling or staying asleep',
    'Feeling tired or having little energy',
    'Poor appetite or overeating',
    'Feeling bad about yourself',
    'Trouble concentrating on things',
    'Moving or speaking so slowly that others noticed, or the opposite',
    'Thoughts that you would be better off dead',
  ];

  void _submitAssessment() async {
    final assessment = await _assessmentController.completePHQ9(_responses);

    if (mounted) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: const Text('Assessment Complete'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Score: ${assessment.score}'),
              const SizedBox(height: 8),
              Text('Interpretation: ${assessment.interpretation}'),
              const SizedBox(height: 16),
              Text(
                'Based on your responses, your depression level is ${assessment.interpretation.toLowerCase()}.',
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: const Text('Done'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('PHQ-9 Assessment'),
        backgroundColor: AppColors.primary,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ..._questions.asMap().entries.map((entry) {
              final index = entry.key;
              final question = entry.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${index + 1}. $question',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ...[0, 1, 2, 3].map((value) {
                        return GestureDetector(
                          onTap: () {
                            setState(() => _responses[index] = value);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: _responses[index] == value
                                  ? AppColors.primary
                                  : AppColors.lightGray,
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: _responses[index] == value
                                    ? AppColors.primary
                                    : AppColors.mediumGray.withOpacity(0.2),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 10,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  value.toString(),
                                  style: TextStyle(
                                    color: _responses[index] == value
                                        ? AppColors.white
                                        : AppColors.darkGray,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  _getLabelForValue(value),
                                  style: TextStyle(
                                    color: _responses[index] == value
                                        ? AppColors.white
                                        : AppColors.mediumGray,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ],
                  ),
                  const SizedBox(height: 24),
                ],
              );
            }),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _submitAssessment,
                child: const Text('Submit Assessment'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getLabelForValue(int value) {
    switch (value) {
      case 0:
        return 'Not';
      case 1:
        return 'Several';
      case 2:
        return 'Half';
      case 3:
        return 'Nearly';
      default:
        return '';
    }
  }
}

class AudioScreen extends StatelessWidget {
  const AudioScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Healing Audio'),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _buildAudioCategory(
              title: 'Binaural Beats',
              description: 'Frequency-based healing sounds',
              tracks: ['432Hz Healing', '528Hz Love', '40Hz Focus'],
            ),
            const SizedBox(height: 16),
            _buildAudioCategory(
              title: 'Guided Meditation',
              description: 'Calming voice guidance',
              tracks: [
                '5-Minute Calm',
                '10-Minute Relaxation',
                '20-Minute Deep',
              ],
            ),
            const SizedBox(height: 16),
            _buildAudioCategory(
              title: 'Sleep Frequencies',
              description: 'Sleep-inducing tracks',
              tracks: ['Delta Sleep', 'Theta Dreams', '8-Hour Night'],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAudioCategory({
    required String title,
    required String description,
    required List<String> tracks,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            Text(
              description,
              style: TextStyle(fontSize: 12, color: AppColors.mediumGray),
            ),
            const SizedBox(height: 12),
            ...tracks.map((track) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  children: [
                    Icon(Icons.play_circle_outline, color: AppColors.primary),
                    const SizedBox(width: 12),
                    Expanded(child: Text(track)),
                    Icon(
                      Icons.download_for_offline_outlined,
                      color: AppColors.accentLight,
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class VideosScreen extends StatelessWidget {
  const VideosScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Wellness Videos'),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildVideoCard(
            title: 'Quick Breathing Exercise',
            duration: '2:30',
            icon: Icons.air,
          ),
          _buildVideoCard(
            title: 'CBT for Anxiety',
            duration: '8:45',
            icon: Icons.lightbulb,
          ),
          _buildVideoCard(
            title: 'Motivation Boost',
            duration: '5:10',
            icon: Icons.trending_up,
          ),
        ],
      ),
    );
  }

  Widget _buildVideoCard({
    required String title,
    required String duration,
    required IconData icon,
  }) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                color: AppColors.accentLight.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: AppColors.accentLight),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    duration,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.mediumGray,
                    ),
                  ),
                ],
              ),
            ),
            Icon(Icons.play_circle_outline, color: AppColors.primary),
          ],
        ),
      ),
    );
  }
}

class MoodHistoryScreen extends StatelessWidget {
  const MoodHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mood History'),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(child: Text('Mood History Coming Soon')),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Profile'),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.person, size: 50, color: AppColors.white),
            ),
            const SizedBox(height: 20),
            const Text(
              'Guest User',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 20),
            _buildProfileOption(title: 'Edit Profile', icon: Icons.edit),
            _buildProfileOption(
              title: 'Language Settings',
              icon: Icons.language,
            ),
            _buildProfileOption(
              title: 'Emergency Contacts',
              icon: Icons.emergency_share,
            ),
            _buildProfileOption(
              title: 'Privacy & Data',
              icon: Icons.privacy_tip,
            ),
            _buildProfileOption(title: 'About Us', icon: Icons.info),
            _buildProfileOption(title: 'Logout', icon: Icons.logout),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileOption({required String title, required IconData icon}) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title),
        trailing: const Icon(Icons.arrow_forward_ios, size: 14),
      ),
    );
  }
}

class ResourcesScreen extends StatelessWidget {
  const ResourcesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resources'),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: const Center(child: Text('Resources Coming Soon')),
    );
  }
}
