import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';
import '../../widgets/custom_widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  late PageController _doctorCarouselController;
  int _currentDoctorIndex = 0;

  @override
  void initState() {
    super.initState();
    _doctorCarouselController = PageController(initialPage: 0);
    _startAutoSwipe();
  }

  @override
  void dispose() {
    _doctorCarouselController.dispose();
    super.dispose();
  }

  void _startAutoSwipe() {
    Future.delayed(const Duration(seconds: 4), () {
      if (mounted && _doctorCarouselController.hasClients) {
        _doctorCarouselController.nextPage(
          duration: const Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
        _startAutoSwipe();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildWelcomeCard(),
              const SizedBox(height: 24),
              _buildDoctorCarousel(),
              const SizedBox(height: 24),
              _buildQuickActionsSection(),
              const SizedBox(height: 28),
              _buildResourcesSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavBar(),
    );
  }

  // Header with simple, eye-friendly design
  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 12, 20, 16),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: 'Mano',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkGray,
                            letterSpacing: 0.3,
                          ),
                        ),
                        TextSpan(
                          text: 'साथी',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primary,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, '/profile'),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.person_rounded,
                    color: AppColors.primary,
                    size: 24,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'How are you feeling today?',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.mediumGray,
              letterSpacing: 0.2,
            ),
          ),
        ],
      ),
    );
  }

  // Doctor Carousel Section - Swipeable Cards
  Widget _buildDoctorCarousel() {
    final doctors = [
      {
        'name': 'Dr. Priya Sharma',
        'specialty': 'Psychiatrist',
        'address': '123 Health Plaza, Mumbai',
        'phone': '+91 98765 43210',
        'icon': Icons.medical_services_rounded,
        'color': AppColors.primary,
      },
      {
        'name': 'Dr. Rajesh Kumar',
        'specialty': 'Therapist',
        'address': '456 Wellness Center, Delhi',
        'phone': '+91 99876 54321',
        'icon': Icons.psychology_rounded,
        'color': AppColors.accent,
      },
      {
        'name': 'Dr. Anjali Patel',
        'specialty': 'Counselor',
        'address': '789 Care Hospital, Bangalore',
        'phone': '+91 97654 32109',
        'icon': Icons.people_rounded,
        'color': AppColors.primaryLight,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Find Expert Help',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.darkGray,
            ),
          ),
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 190,
          child: PageView.builder(
            controller: _doctorCarouselController,
            onPageChanged: (index) {
              setState(() => _currentDoctorIndex = index % doctors.length);
            },
            itemBuilder: (context, index) {
              final doctor = doctors[index % doctors.length];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildDoctorCard(doctor),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        // Indicator Dots
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              doctors.length,
              (index) => Container(
                width: 8,
                height: 8,
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentDoctorIndex == index
                      ? AppColors.primary
                      : AppColors.mediumGray.withOpacity(0.3),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDoctorCard(Map<String, dynamic> doctor) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: (doctor['color'] as Color).withOpacity(0.12),
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.mediumGray.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Icon and Name Section
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: (doctor['color'] as Color).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: Icon(
                      doctor['icon'] as IconData,
                      color: doctor['color'] as Color,
                      size: 26,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor['name'] as String,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                            color: AppColors.darkGray,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          doctor['specialty'] as String,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w600,
                            color: doctor['color'] as Color,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // Divider
              Container(
                height: 1,
                color: (doctor['color'] as Color).withOpacity(0.1),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Address and Contact
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: (doctor['color'] as Color).withOpacity(0.7),
                    size: 14,
                  ),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      doctor['address'] as String,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.mediumGray,
                        fontWeight: FontWeight.w500,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Icon(
                    Icons.phone_rounded,
                    color: doctor['color'] as Color,
                    size: 14,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    doctor['phone'] as String,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.darkGray,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.2,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Welcome Card with mood status
  Widget _buildWelcomeCard() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.mediumGray.withOpacity(0.06),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: AppColors.lightGray,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Center(child: Text('😊', style: TextStyle(fontSize: 32))),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'You\'re doing great!',
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: AppColors.darkGray,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Keep up the positive momentum',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.mediumGray,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Quick Actions - Horizontal Scrollable Cards
  Widget _buildQuickActionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            'Quick Actions',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.darkGray,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              _buildQuickActionCard(
                icon: Icons.phone_in_talk_rounded,
                title: 'Talk',
                subtitle: 'Voice Support',
                gradient: const LinearGradient(
                  colors: [AppColors.lightGray, AppColors.lightGray],
                ),
                onTap: () => Navigator.pushNamed(context, '/talk'),
              ),
              const SizedBox(width: 16),
              _buildQuickActionCard(
                icon: Icons.chat_bubble_rounded,
                title: 'Chat',
                subtitle: 'AI Companion',
                gradient: const LinearGradient(
                  colors: [AppColors.lightGray, AppColors.lightGray],
                ),
                onTap: () => Navigator.pushNamed(context, '/chatbot'),
              ),
              const SizedBox(width: 16),
              _buildQuickActionCard(
                icon: Icons.support_agent_rounded,
                title: 'Support',
                subtitle: 'Resources',
                gradient: const LinearGradient(
                  colors: [AppColors.lightGray, AppColors.lightGray],
                ),
                onTap: () => Navigator.pushNamed(context, '/support'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActionCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Gradient gradient,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        height: 180,
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: AppColors.mediumGray.withOpacity(0.12)),
          boxShadow: [
            BoxShadow(
              color: AppColors.mediumGray.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(icon, color: AppColors.darkGray, size: 28),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkGray,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                      color: AppColors.mediumGray,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Resources Section - Grid Layout
  Widget _buildResourcesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Wellness Resources',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkGray,
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pushNamed(context, '/resources'),
                child: Text(
                  'See All',
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: _buildResourceCard(
                      icon: Icons.psychology_alt,
                      title: 'Self-Assessment',
                      color: AppColors.primary,
                      onTap: () => Navigator.pushNamed(context, '/assessments'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildResourceCard(
                      icon: Icons.favorite_rounded,
                      title: 'Mood Check',
                      color: AppColors.accent,
                      onTap: () => Navigator.pushNamed(context, '/mood-check'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: _buildResourceCard(
                      icon: Icons.headphones_rounded,
                      title: 'Audio Therapy',
                      color: AppColors.primaryLight,
                      onTap: () => Navigator.pushNamed(context, '/audio'),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _buildResourceCard(
                      icon: Icons.video_library_rounded,
                      title: 'Video Library',
                      color: AppColors.accentLight,
                      onTap: () => Navigator.pushNamed(context, '/videos'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              _buildFullWidthResourceCard(
                icon: Icons.insights_rounded,
                title: 'Your Progress & Insights',
                subtitle: 'Track your wellness journey',
                color: AppColors.primary,
                onTap: () => Navigator.pushNamed(context, '/mood-history'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildResourceCard({
    required IconData icon,
    required String title,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.1), width: 1.0),
          boxShadow: [
            BoxShadow(
              color: AppColors.mediumGray.withOpacity(0.06),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                color: color.withOpacity(0.12),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: color, size: 26),
            ),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: AppColors.darkGray,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFullWidthResourceCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [color.withOpacity(0.06), color.withOpacity(0.03)],
          ),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: color.withOpacity(0.15), width: 1.5),
        ),
        child: Row(
          children: [
            Container(
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: color.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkGray,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 13,
                      color: AppColors.mediumGray,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              size: 16,
              color: color.withOpacity(0.5),
            ),
          ],
        ),
      ),
    );
  }

  // Bottom Navigation Bar
  Widget _buildBottomNavBar() {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.mediumGray.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _buildNavItem(Icons.home_rounded, 'Home', 0),
              _buildNavItem(Icons.calendar_today_rounded, 'Mood', 1),
              _buildNavItem(Icons.library_books_rounded, 'Library', 2),
              _buildNavItem(Icons.person_rounded, 'Profile', 3),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    final isSelected = _selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() => _selectedIndex = index);
        _handleBottomNavigation(index);
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.accent.withOpacity(0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? AppColors.accent : AppColors.mediumGray,
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
                color: isSelected ? AppColors.accent : AppColors.mediumGray,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleBottomNavigation(int index) {
    switch (index) {
      case 0:
        break;
      case 1:
        Navigator.pushNamed(context, '/mood-check');
        break;
      case 2:
        Navigator.pushNamed(context, '/audio');
        break;
      case 3:
        Navigator.pushNamed(context, '/profile');
        break;
    }
  }
}
