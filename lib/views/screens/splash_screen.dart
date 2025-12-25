import 'package:flutter/material.dart';
import '../../themes/app_theme.dart';
import '../../utils/splash_image_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _fadeController;
  late AnimationController _scaleController;
  late AnimationController _slideController;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _scaleController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    _slideController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _startAnimations();
    _navigateToHome();
  }

  void _startAnimations() {
    _fadeController.forward();
    _scaleController.forward();
    _slideController.forward();
  }

  void _navigateToHome() {
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        Navigator.of(context).pushReplacementNamed('/home');
      }
    });
  }

  @override
  void dispose() {
    _fadeController.dispose();
    _scaleController.dispose();
    _slideController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: Stack(
        children: [
          // Animated Background Gradient
          FadeTransition(
            opacity: _fadeController,
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary.withOpacity(0.05),
                    AppColors.accentLight.withOpacity(0.05),
                  ],
                ),
              ),
            ),
          ),

          // Animated Circles (decorative)
          Positioned(
            top: -100,
            right: -100,
            child: FadeTransition(
              opacity: _fadeController,
              child: Transform.scale(
                scale: 1.0,
                child: Container(
                  width: 300,
                  height: 300,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withOpacity(0.08),
                  ),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: -80,
            left: -80,
            child: FadeTransition(
              opacity: _fadeController,
              child: Container(
                width: 250,
                height: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.accentLight.withOpacity(0.08),
                ),
              ),
            ),
          ),

          // Main Content
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Splash Image with Logo
                  ScaleTransition(
                    scale: Tween(begin: 0.8, end: 1.0).animate(
                      CurvedAnimation(
                        parent: _scaleController,
                        curve: Curves.easeOutBack,
                      ),
                    ),
                    child: SplashImage.buildSplashImage(),
                  ),

                  const SizedBox(height: 40),

                  // App Name - Animated Slide and Fade
                  SlideTransition(
                    position:
                        Tween(
                          begin: const Offset(0, 0.5),
                          end: Offset.zero,
                        ).animate(
                          CurvedAnimation(
                            parent: _slideController,
                            curve: Curves.easeOut,
                          ),
                        ),
                    child: FadeTransition(
                      opacity: _fadeController,
                      child: Column(
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Mano',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.primary,
                                  ),
                                ),
                                TextSpan(
                                  text: 'साथी',
                                  style: TextStyle(
                                    fontSize: 40,
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.accentLight,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Mental Health Detection & Support',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.mediumGray,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 60),

                  // Loading Indicator - Animated
                  FadeTransition(
                    opacity: _fadeController,
                    child: Column(
                      children: [
                        SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.primary.withOpacity(0.7),
                            ),
                            strokeWidth: 3,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Loading your wellness journey...',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: AppColors.mediumGray,
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLogoIcon() {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Glow Background
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: RadialGradient(
              colors: [
                AppColors.accentLight.withOpacity(0.3),
                AppColors.accentLight.withOpacity(0.0),
              ],
            ),
          ),
        ),

        // Brain Icon (Left) - Enhanced with background
        Transform.translate(
          offset: const Offset(-18, -2),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primaryDark.withOpacity(0.2),
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(
              Icons.psychology,
              size: 50,
              color: AppColors.white,
            ),
          ),
        ),

        // Heart Icon (Right) - Enhanced with background
        Transform.translate(
          offset: const Offset(18, 2),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.accentLight.withOpacity(0.3),
            ),
            padding: const EdgeInsets.all(8),
            child: const Icon(Icons.favorite, size: 48, color: AppColors.white),
          ),
        ),

        // Animated Heartbeat Line
        ScaleTransition(
          scale: Tween(begin: 0.8, end: 1.2).animate(
            CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
          ),
          child: Positioned(
            left: 10,
            right: 10,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 2,
                    color: AppColors.white.withOpacity(0.4),
                  ),
                ),
                const SizedBox(width: 4),
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.accentLight,
                  ),
                ),
                const SizedBox(width: 4),
                Expanded(
                  child: Container(
                    height: 2,
                    color: AppColors.white.withOpacity(0.4),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // New Mood Head Icon with Three Hearts
  Widget _buildMoodHeadIcon() {
    return SizedBox(
      width: 200,
      height: 200,
      child: Stack(
        children: [
          // Head Silhouette
          Positioned(
            left: 30,
            top: 20,
            child: FadeTransition(
              opacity: _fadeController,
              child: CustomPaint(
                size: const Size(140, 160),
                painter: HeadSilhouettePainter(),
              ),
            ),
          ),

          // Red Angry Heart (Top Left)
          Positioned(
            left: 50,
            top: 40,
            child: ScaleTransition(
              scale: Tween(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _scaleController,
                  curve: const Interval(0.0, 0.5, curve: Curves.elasticOut),
                ),
              ),
              child: _buildMoodHeart(
                color: const Color(0xFFE63946),
                emoji: '😠',
                size: 50,
              ),
            ),
          ),

          // Green Happy Heart (Bottom Left)
          Positioned(
            left: 40,
            top: 100,
            child: ScaleTransition(
              scale: Tween(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _scaleController,
                  curve: const Interval(0.2, 0.7, curve: Curves.elasticOut),
                ),
              ),
              child: _buildMoodHeart(
                color: const Color(0xFF06D6A0),
                emoji: '😄',
                size: 55,
              ),
            ),
          ),

          // Blue Calm Heart (Right)
          Positioned(
            right: 30,
            top: 70,
            child: ScaleTransition(
              scale: Tween(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(
                  parent: _scaleController,
                  curve: const Interval(0.4, 0.9, curve: Curves.elasticOut),
                ),
              ),
              child: _buildMoodHeart(
                color: const Color(0xFF457B9D),
                emoji: '😊',
                size: 48,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMoodHeart({
    required Color color,
    required String emoji,
    required double size,
  }) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.4),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Heart shape using path
          CustomPaint(
            size: Size(size, size),
            painter: HeartPainter(color: color),
          ),
          // Emoji in center
          Center(
            child: Text(emoji, style: TextStyle(fontSize: size * 0.5)),
          ),
        ],
      ),
    );
  }
}

// Custom Painter for Head Silhouette
class HeadSilhouettePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.primary.withOpacity(0.15)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    final path = Path();

    // Draw head outline
    path.moveTo(size.width * 0.5, size.height * 0.1);

    // Top of head
    path.quadraticBezierTo(
      size.width * 0.2,
      size.height * 0.15,
      size.width * 0.1,
      size.height * 0.4,
    );

    // Left side
    path.quadraticBezierTo(
      size.width * 0.05,
      size.height * 0.6,
      size.width * 0.15,
      size.height * 0.75,
    );

    // Neck left
    path.lineTo(size.width * 0.35, size.height * 0.95);

    // Neck bottom (don't connect, leave open)
    path.moveTo(size.width * 0.65, size.height * 0.95);

    // Neck right
    path.lineTo(size.width * 0.85, size.height * 0.75);

    // Right side
    path.quadraticBezierTo(
      size.width * 0.95,
      size.height * 0.6,
      size.width * 0.9,
      size.height * 0.4,
    );

    // Top right
    path.quadraticBezierTo(
      size.width * 0.8,
      size.height * 0.15,
      size.width * 0.5,
      size.height * 0.1,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

// Custom Painter for Heart Shape
class HeartPainter extends CustomPainter {
  final Color color;

  HeartPainter({required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    final path = Path();

    final width = size.width;
    final height = size.height;

    path.moveTo(width * 0.5, height * 0.35);

    // Left curve
    path.cubicTo(
      width * 0.2,
      height * 0.1,
      -width * 0.15,
      height * 0.3,
      width * 0.5,
      height * 0.85,
    );

    // Right curve
    path.moveTo(width * 0.5, height * 0.35);
    path.cubicTo(
      width * 0.8,
      height * 0.1,
      width * 1.15,
      height * 0.3,
      width * 0.5,
      height * 0.85,
    );

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
