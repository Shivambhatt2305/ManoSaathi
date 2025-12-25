import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';

// Coming Soon Screen for Talk Feature
class ComingSoonScreen extends StatelessWidget {
  const ComingSoonScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Talk Feature'),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 120,
                height: 120,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      AppColors.primary.withOpacity(0.2),
                      AppColors.accentLight.withOpacity(0.2),
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.construction_rounded,
                  size: 60,
                  color: AppColors.primary,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                'Coming Soon!',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkGray,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'We\'re working hard to bring you voice call support with mental health professionals.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.mediumGray,
                  fontWeight: FontWeight.w500,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: AppColors.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.primary.withOpacity(0.2)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.notifications_active_outlined,
                      color: AppColors.primary,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Stay tuned for updates!',
                      style: TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Support Screen with Videos and Audio Tabs
class SupportScreen extends StatefulWidget {
  const SupportScreen({Key? key}) : super(key: key);

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        title: const Text('Support Resources'),
        backgroundColor: AppColors.primary,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: AppColors.white,
          indicatorWeight: 3,
          labelColor: AppColors.white,
          unselectedLabelColor: AppColors.white.withOpacity(0.6),
          labelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
          ),
          unselectedLabelStyle: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
          tabs: const [
            Tab(icon: Icon(Icons.video_collection), text: 'Videos'),
            Tab(icon: Icon(Icons.headphones), text: 'Support Audios'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [_buildVideosTab(), _buildAudioTab()],
      ),
    );
  }

  Widget _buildVideosTab() {
    final videos = [
      {
        'title': 'Understanding Mental Health',
        'subtitle': 'Introduction to wellness',
        'duration': '12:30',
        'thumbnail': Icons.psychology_alt,
      },
      {
        'title': 'Breathing Techniques',
        'subtitle': 'Reduce anxiety naturally',
        'duration': '8:45',
        'thumbnail': Icons.air,
      },
      {
        'title': 'Cognitive Behavioral Therapy',
        'subtitle': 'CBT basics explained',
        'duration': '15:20',
        'thumbnail': Icons.lightbulb_outline,
      },
      {
        'title': 'Mindfulness Meditation',
        'subtitle': 'Daily practice guide',
        'duration': '10:15',
        'thumbnail': Icons.self_improvement,
      },
      {
        'title': 'Managing Stress',
        'subtitle': 'Practical strategies',
        'duration': '11:40',
        'thumbnail': Icons.spa,
      },
      {
        'title': 'Building Resilience',
        'subtitle': 'Strengthen your mind',
        'duration': '13:55',
        'thumbnail': Icons.fitness_center,
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: videos.length,
      itemBuilder: (context, index) {
        final video = videos[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.primary.withOpacity(0.1)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withOpacity(0.15),
                    AppColors.accentLight.withOpacity(0.15),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                video['thumbnail'] as IconData,
                color: AppColors.primary,
                size: 30,
              ),
            ),
            title: Text(
              video['title'] as String,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: AppColors.darkGray,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: [
                  Icon(
                    Icons.play_circle_outline,
                    size: 14,
                    color: AppColors.mediumGray,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    video['duration'] as String,
                    style: TextStyle(fontSize: 12, color: AppColors.mediumGray),
                  ),
                  const SizedBox(width: 8),
                  Text('•', style: TextStyle(color: AppColors.mediumGray)),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      video['subtitle'] as String,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.mediumGray,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            trailing: Icon(
              Icons.play_arrow_rounded,
              color: AppColors.primary,
              size: 32,
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Playing: ${video['title']}'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
          ),
        );
      },
    );
  }

  Widget _buildAudioTab() {
    final audios = [
      {
        'title': '432 Hz Healing Frequency',
        'subtitle': 'Deep relaxation',
        'duration': '20:00',
        'frequency': '432 Hz',
      },
      {
        'title': '528 Hz Love & Miracles',
        'subtitle': 'DNA repair frequency',
        'duration': '25:00',
        'frequency': '528 Hz',
      },
      {
        'title': '396 Hz Liberation',
        'subtitle': 'Release fear & guilt',
        'duration': '18:30',
        'frequency': '396 Hz',
      },
      {
        'title': '639 Hz Relationships',
        'subtitle': 'Harmony & connection',
        'duration': '22:15',
        'frequency': '639 Hz',
      },
      {
        'title': '741 Hz Awakening',
        'subtitle': 'Intuition & expression',
        'duration': '19:45',
        'frequency': '741 Hz',
      },
      {
        'title': 'Guided Sleep Meditation',
        'subtitle': 'Peaceful rest',
        'duration': '30:00',
        'frequency': 'Guided',
      },
      {
        'title': 'Anxiety Relief Meditation',
        'subtitle': 'Calm your mind',
        'duration': '15:30',
        'frequency': 'Guided',
      },
      {
        'title': 'Morning Motivation',
        'subtitle': 'Start your day right',
        'duration': '12:00',
        'frequency': 'Guided',
      },
    ];

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: audios.length,
      itemBuilder: (context, index) {
        final audio = audios[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.accentLight.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.04),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            leading: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.accentLight.withOpacity(0.2),
                    AppColors.accentLight.withOpacity(0.05),
                  ],
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.graphic_eq_rounded,
                color: AppColors.accentLight,
                size: 30,
              ),
            ),
            title: Text(
              audio['title'] as String,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 14,
                color: AppColors.darkGray,
              ),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 4),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.accentLight.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      audio['frequency'] as String,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: AppColors.accentLight,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Icon(
                    Icons.timer_outlined,
                    size: 12,
                    color: AppColors.mediumGray,
                  ),
                  const SizedBox(width: 4),
                  Text(
                    audio['duration'] as String,
                    style: TextStyle(fontSize: 12, color: AppColors.mediumGray),
                  ),
                ],
              ),
            ),
            trailing: Icon(
              Icons.play_circle_fill_rounded,
              color: AppColors.accentLight,
              size: 36,
            ),
            onTap: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Playing: ${audio['title']}'),
                  backgroundColor: AppColors.success,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
